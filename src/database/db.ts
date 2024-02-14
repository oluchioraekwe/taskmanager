import { Sequelize } from "sequelize";
import dotenv from "dotenv"
dotenv.config()

const database = process.env.DATABASE as string
const username = process.env.DATABASE_USERNAME as string
const password = process.env.DB_PASSWORD as string
const host = process.env.HOST as string
const port = process.env.DB_PORT as unknown as number


  export const sequelize = new Sequelize({
    database: database,
    dialect: 'mysql',
    username: username,
    password: password,
    port: +port,
    logging:false,
    host:host,
  });

export async function dbConnection(){
    try {
        await sequelize.sync({alter:false});
        console.log('Database connected successfully.');
      } catch (error) {
        console.error('Unable to connect to the database:', error);
      }
}
