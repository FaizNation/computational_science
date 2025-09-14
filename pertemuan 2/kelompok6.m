clc
clear

total_meetings = 16;
next = 'y';

while (next == 'y' || next == 'Y')
    name = input('Masukkan nama siswa: ', 's');
    hadir = input('Masukkan jumlah Kehadiran (Max-16): ');

    if hadir < 0 || hadir > total_meetings
        fprintf('╔═════════════════════════════════════════════════════════╗\n');
        fprintf('║Jumlah kehadiran tidak valid! Harus antara 0 hingga %-4d ║\n', total_meetings);
        fprintf('╚═════════════════════════════════════════════════════════╝\n');
    else

        alpha = total_meetings - hadir;
        percentage = (hadir / total_meetings) * 100;

        if percentage >= 75
            status = 'hadir';
        else
            status = 'Alpha';
        end

        fprintf('\n');
        fprintf('╔═══════════════════════════════════════════════╗\n');
        fprintf('║                 REKAP ABSENSI                 ║\n');
        fprintf('╠═══════════════════════════════════════════════╣\n');
        fprintf('║ Nama Mahasiswa   : %-26s ║\n', name);
        fprintf('║ Jumlah Hadir     : %d dari %d pertemuan       ║\n', hadir, total_meetings);
        fprintf('║ Jumlah Alpha     : %-27d║\n', alpha);
        fprintf('║ percentage hadir : %.f%%                        ║\n', percentage);
        fprintf('║ Status Kehadiran : %-27s║\n', status);
        fprintf('╚═══════════════════════════════════════════════╝\n');
    end

    next = input('Apakah ingin input siswa lain? jika iya ketik "y": ', 's');
end

fprintf('\n');
fprintf('╔═════════════════════════════════════════════════════════╗\n');
fprintf('║                    By Jenar & Fais                      ║\n');
fprintf('╚═════════════════════════════════════════════════════════╝\n');