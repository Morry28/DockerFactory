type UserInput = {
  data_path: string;
  //  output_path: string;
  learning_rate?: number;
  batch_size?: number;
  num_epochs?: number;
  GS_key: string;
}

const userInput: UserInput = {
  data_path: "gs://bucket-name/input-data.csv",
  //  output_path: "gs://bucket-name/output-model.xxx",
  learning_rate: 0.001,
  batch_size: 32,
  num_epochs: 10,
  GS_key: 'xxxyyy'
}

import express, { request, response } from "express"

const app = express()

app.get("/", (request, response) => {
  response.json({
    message: "Hello World"
  })
  console.log('a commoner just arrived')
})

app.listen(3000, () => {
  console.log("Server is running")
})