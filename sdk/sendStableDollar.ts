import { ethers } from "ethers";

export async function sendStableDollar(
  routerAddress: string,
  fromToken: string,
  amount: number,
  recipient: string,
  provider: ethers.providers.Provider,
  signer: ethers.Signer
) {
  const router = new ethers.Contract(
    routerAddress,
    ["function convertToStableDollar(address fromToken, uint256 amount) external returns (uint256)"],
    signer
  );
  const tx = await router.convertToStableDollar(fromToken, amount);
  await tx.wait();
  // Transfer stable token to recipient after conversion...
}