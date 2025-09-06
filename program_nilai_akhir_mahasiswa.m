name = input('Siapa nama anda?: ', 's');
task = input('Masukan nilai TUGAS: ');
uts = input('Masukan nilai UTS: ');
uas = input('Masukan nilai UAS: ');

if task < 0 || task > 100 || uts < 0 || uts > 100 || uas < 0 || uas > 100
    disp('Nilai yang anda masukan tidak valid!');
    return;
end 

score = (task * 0.45) + (uts * 0.25) + (uas * 0.30);

if score >= 60
    stated = 'LULUS';
else
    stated = 'TIDAK LULUS';
end

fprintf('\n');
fprintf('╔═══════════════════════════════════════════════╗\n');
fprintf('║              HASIL NILAI AKHIR                ║\n');
fprintf('╠═══════════════════════════════════════════════╣\n');
fprintf('║ Nama anda         : %-25s ║\n', name);
fprintf('║ Nilai Tugas anda  : %-25d ║\n', round(task));
fprintf('║ Nilai UTS anda    : %-25d ║\n', round(uts));
fprintf('║ Nilai UAS anda    : %-25d ║\n', round(uas));
fprintf('║ Final Score anda  : %-25d ║\n', round(score));
fprintf('║ Status Kelulusan  : %-25s ║\n', stated);
fprintf('╚═══════════════════════════════════════════════╝\n');