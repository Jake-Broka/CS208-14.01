var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next){
  res.render('index');
});

/*GET menu page */
router.get('/menu', function(req, res, next){
  try{
    req.db.query('SELECT * FROM menu', (err, results) => {
    if(err) {
      console.error('Error fetching menu:', err);
      return res.status(500).send('Error fetching reviews');
    }
    res.render('menu', {title: 'Menu', menu: results});
    })
  } catch (error) {
    console.error('Error fetching menu:', error);
    res.status(500).send('Error fetching menu');
  }
});

/* GET item page*/
router.get('/menu/:item', function(req, res, next){
  const menuItem = req.params.item;
  try{
    req.db.query('SELECT * FROM menu WHERE item = ?', [menuItem], (err, results) => {
    if(err) {
      console.error('Error fetching item:', err);
      return res.status(500).send('Error fetching item');
    }
    if(results.length > 0){
      res.render('item', {title: results[0].item, details: results[0].description});
    } else {
      res.status(404).render('error');
    }
    })
  } catch (error) {
    console.error('Error fetching menu:', error);
    res.status(500).send('Error fetching menu');
  }
});

/*GET about page */
router.get('/about', function(req, res, next){
  res.render('about');
});

/*GET reviews page */
router.get('/reviews', function(req, res, next){
  const currentPage = parseInt(req.query.page) || 1;
  const limit = 10;
  const offset = (currentPage - 1) * limit;

  try{
    //Query for a count of every review in the table
    req.db.query('SELECT COUNT(*) AS total FROM reviews', (err, countResults) => {
      if(err) {
        console.error('Error fetching reviews:', err);
        return res.status(500).send('Error fetching reviews');
      }

      //Put total number of reviews and pages into variables to return
      const totalReviews = countResults[0].total;
      const totalPages = Math.ceil(totalReviews / limit) || 1;

      //Grabs the next 10 reviews for the page
      req.db.query('SELECT * FROM reviews ORDER BY timestamp DESC LIMIT ? OFFSET ? ',[limit, offset], (err, results) => {
          if(err){
            console.error('Error fetching reviews:',err);
            return res.status(500).send('Error fetching reviews');
          }
          //Cleans up the reviews so timestamps are human readable
          const formattedReviews = results.map(row => {
              return {
                ...row,
                timestamp: row.timestamp.toLocaleDateString('en-US', {
                  month: '2-digit',
                  day: '2-digit',
                  year: '2-digit',
                  hour: '2-digit',
                  minute: '2-digit',
                  timeZoneName: 'short',
                  timeZone: 'America/Denver'
                })
              };
          });

          res.render('reviews', {reviews: formattedReviews, totalPages: totalPages, currentPage: currentPage});
      });

    });
  } catch (error) {
    console.error('Error fetching reviews:', error);
    res.status(500).send('Error fetching reviews');
  }
});

/* POST reviews */
router.post('/reviews/send', function (req, res, next) {
    const { review } = req.body;
    if(review.trim()){
      try {
        req.db.query('INSERT INTO reviews (review) VALUES (?);', [review], (err, results) => {
          if (err) {
            console.error('Error adding review:', err);
            return res.status(500).send('Error adding review');
          }
          console.log('Review added successfully:', results);
          // Redirect to the review page after adding
          res.redirect('/reviews');
        });
      } catch (error) {
        console.error('Error adding review:', error);
        res.status(500).send('Error adding review');
      }
    } else {
      console.log("Blank edit input!");
      res.redirect('/reviews');
    }
});

router.post('/delete', function (req, res, next) {
    const { id } = req.body;
    try {
      req.db.query('DELETE FROM todos WHERE id = ?;', [id], (err, results) => {
        if (err) {
          console.error('Error deleting todo:', err);
          return res.status(500).send('Error deleting todo');
        }
        console.log('Todo deleted successfully:', results);
        // Redirect to the home page after deletion
        res.redirect('/');
    });
    }catch (error) {
        console.error('Error deleting todo:', error);
        res.status(500).send('Error deleting todo:');
    }
});

module.exports = router;