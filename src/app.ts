import createError from 'http-errors';
import express from 'express';
import path from 'path';
import cookieParser from 'cookie-parser';
import logger from 'morgan';
import cors from 'cors'

import indexRouter from './routes/index';
import usersRouter from './routes/users';
import tasksRouter from './routes/tasks'
import {dbConnection} from './database/db';

var app = express();
dbConnection()
const corsOptions = {
  origin: 'http://localhost:3000',
  optionsSuccessStatus: 200 
}
// view engine setup
app.set('views', path.join(__dirname, '..','views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(cors())
app.use(express.static(path.join(__dirname, "..",'public')));

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/tasks',tasksRouter)

// catch 404 and forward to error handler
app.use(function(req:express.Request, res:express.Response, next:express.NextFunction) {
  next(createError(404));
});

// error handler
app.use(function(err:createError.HttpError, req:express.Request, res:express.Response, next:express.NextFunction) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

export default app;
