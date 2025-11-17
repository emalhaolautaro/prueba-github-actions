// @ts-check
import { test, expect } from '@playwright/test';

test('increments counter', async ({ page }) => {
  await page.goto('/');

  // Encuentra el botón del contador y haz clic en él.
  const counterButton = page.getByRole('button', { name: /count is/ });
  await expect(counterButton).toHaveText('count is 0');

  await counterButton.click();
  await expect(counterButton).toHaveText('count is 1');
});