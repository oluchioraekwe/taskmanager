import {Router, Request,Response} from 'express';
const router = Router();

/* GET home page. */
// router.get('/', function(req:Request, res:Response) {
//   res.render('index', { title: 'Express' });
// });

router.get('/health', function(req:Request, res:Response) {
  return res.status(200).send("SERVER HEALTHY")
});

export default router;
