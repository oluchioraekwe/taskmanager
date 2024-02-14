import jsonwebtoke from "jsonwebtoken"
import { IPayload } from "../interface/userInterface"
import dotenv from "dotenv"
dotenv.config()

 const SECRETE = process.env.TOKEN_KEY as string

export const signToken = async(payload:IPayload)=>{
    return jsonwebtoke.sign(payload,SECRETE,{
        expiresIn:3600
    })
}

export const verifyToken = async(token:string): Promise<IPayload>=>{
    return jsonwebtoke.verify(token,SECRETE) as IPayload
}

export const decodeToken = async(token: string)=>{
    return jsonwebtoke.decode(token)
}