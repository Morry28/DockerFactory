"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const userInput = {
    data_path: "gs://bucket-name/input-data.csv",
    //  output_path: "gs://bucket-name/output-model.xxx",
    learning_rate: 0.001,
    batch_size: 32,
    num_epochs: 10,
    GS_key: 'xxxyyy'
};
const express_1 = __importDefault(require("express"));
const app = (0, express_1.default)();
app.get("/", (request, response) => {
    response.json({
        message: "Hello World"
    });
    console.log('a commoner just arrived');
});
app.listen(3000, () => {
    console.log("Server is running");
});
