import { Rails } from "./init";

export function railsMakeGetRequest(
  url,
  success = () => {},
  error = () => {},
  data = ""
) {
  Rails.ajax({
    url,
    type: "get",
    data,
    success,
    error,
  });
}
