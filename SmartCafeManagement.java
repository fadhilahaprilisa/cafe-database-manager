import smartcafe.interfaces.*;
import smartcafe.model.*;
import smartcafe.dao.LaporanDAO;
import java.util.ArrayList;

public static void main(String[] args) {

    // ── TEST 1: Interface constants accessible ────────────────────────────────
    System.out.println("Metode bayar: " + Payable.METODE_TUNAI);
    System.out.println("Format CSV:   " + Reportable.FORMAT_CSV);

    // ── TEST 2: Abstract class cannot be instantiated ─────────────────────────
    // new BaseLaporan("x","y","z"); // ← this would be a compiler error — good!

    // ── TEST 3: Concrete children compile and format() works ─────────────────
    LaporanDAO dao = new LaporanDAO();
    LaporanPenjualan lp = dao.getLaporanPenjualan("Ahmad SPV");
    LaporanStok      ls = dao.getLaporanStok("Ahmad SPV");

    // MEETING 12 — polymorphism through interface
    Reportable[] semuaLaporan = { lp, ls };

    for (Reportable r : semuaLaporan) {
        System.out.println("\n" + r.getJudulLaporan());
        System.out.println(r.generateLaporan(Reportable.FORMAT_CONSOLE));

        // Default method from interface — no override needed
        System.out.println("CSV preview:");
        System.out.println(r.exportKeCsv(r.getDataRows(), r.getKolomHeader()));
    }

    // ── TEST 4: Summary getters for GUI cards ─────────────────────────────────
    System.out.println("Pendapatan : " + lp.getTotalPendapatan());
    System.out.println("Transaksi  : " + lp.getTotalTransaksi());
    System.out.println("Bersih     : " + lp.getPendapatanBersih());
    System.out.println("Stok rendah: " + ls.getItemStokRendah());

    // ── TEST 5: Payable default method ───────────────────────────────────────
    // Any class implementing Payable gets hitungPajakString() for free
    // (Member 2 adds "implements Payable" to Transaksi — test shows what they get)
    System.out.println(new Payable() {
        public boolean prosesPembayaran(double j, String m) { return true; }
        public String  getBuktiPembayaran()  { return "TEST-001"; }
        public String  getMetodePembayaran() { return METODE_TUNAI; }
    }.hitungPajakString(100000));

    smartcafe.database.DatabaseConnection.closeConnection();
}