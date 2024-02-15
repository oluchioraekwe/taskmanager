import { Sequelize } from "sequelize";
import dotenv from "dotenv"
dotenv.config()

export const sequelize = new Sequelize('taskmanager','','',{
  dialect: 'sqlite',
  storage: './database.sqlite',
  logging:false
});

export async function dbConnection(){
    try {
        await sequelize.sync({alter:false});
        console.log('Database connected successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
      }
}
