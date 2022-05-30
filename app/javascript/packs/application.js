import "./init";
import { railsMakeGetRequest } from "./helper";

const log_request = (data) => console.log(data);
const test_param = "test";
railsMakeGetRequest(
  `/suburbs.json?filter-by-region=${test_param}`,
  log_request
);
