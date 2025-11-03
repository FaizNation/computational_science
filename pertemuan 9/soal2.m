aktual_A = 200;
terukur_A = 202;
aktual_B = 5;
terukur_B = 7;

re_A = abs(terukur_A - aktual_A) / abs(aktual_A);
re_B = abs(terukur_B - aktual_B) / abs(aktual_B);

fprintf('Obat A -> Aktual: %d mg, Terukur: %d mg\n', aktual_A, terukur_A);
fprintf('Relative Error Obat A: %.4f (atau %.2f%%)\n', re_A, re_A * 100);

fprintf('Obat B -> Aktual: %d mg, Terukur: %d mg\n', aktual_B, terukur_B);
fprintf('Relative Error Obat B: %.4f (atau %.2f%%)\n', re_B, re_B * 100);

if (re_B > re_A)
    fprintf('Kesimpulan: Pengukuran Obat B (%.2f%%) secara proporsional LEBIH TIDAK AKURAT.\n\n', re_B * 100);
else
    fprintf('Kesimpulan: Pengukuran Obat A (%.2f%%) secara proporsional LEBIH TIDAK AKURAT.\n\n', re_A * 100);
endif
