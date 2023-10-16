import express from "express";
import path from 'path';
import { fileURLToPath } from 'url';
import indexRouter from "./routes/indexRouter.js";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const app = express();

app.set('views', path.join(__dirname, '../views')); 
app.set("view engine", "pug");
app.use(express.static(path.join(__dirname, 'public')));
app.use(indexRouter);

app.listen(3000, () => { 
    console.log("listening on http://localhost:3000"); 
});