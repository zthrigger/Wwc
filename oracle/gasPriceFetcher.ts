import axios from "axios";

export async function fetchEthereumGas() {
  const res = await axios.get("https://ethgasstation.info/json/ethgasAPI.json");
  return res.data.fast / 10; // Gwei
}
// Add similar functions for other chains as needed.