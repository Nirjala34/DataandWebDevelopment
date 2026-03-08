<%@ Page Title="Executive Intelligence Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="ExecutiveDashboard.aspx.cs" Inherits="Data_and_Web_Development_Final.ExecutiveDashboard" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <!-- Dashboard Header -->
            <div class="d-flex justify-content-between align-items-center mb-5">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-1">
                            <li class="breadcrumb-item"><a href="Default.aspx"
                                    class="text-white opacity-50 text-decoration-none small">Home</a></li>
                            <li class="breadcrumb-item active text-white small" aria-current="page">Dashboard</li>
                        </ol>
                    </nav>
                    <h1 class="display-5 fw-bold text-white mb-0" style="letter-spacing: -1.5px;">Executive <span
                            style="color: var(--primary-accent);">Intelligence</span></h1>
                    <p class="text-dim mb-0 opacity-75">Global network operations and revenue analytical overview</p>
                </div>
                <div class="d-none d-md-block text-end">
                    <div class="text-white fw-bold fs-4 mb-0">
                        <%= DateTime.Now.ToString("HH:mm") %>
                    </div>
                    <div class="text-dim small text-uppercase tracking-wider">
                        <%= DateTime.Now.ToString("dd MMM yyyy") %>
                    </div>
                </div>
            </div>

            <!-- Metric Overview Rows -->
            <div class="row g-4 mb-5">
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="rounded-circle p-2" style="background: rgba(255, 0, 127, 0.1);">
                                <i class="bi bi-currency-dollar fs-4 text-white"
                                    style="color: var(--primary-accent) !important;"></i>
                            </div>
                            <span class="badge rounded-pill bg-success bg-opacity-10 text-success small">+12.5%</span>
                        </div>
                        <div class="text-dim small text-uppercase fw-bold tracking-wider mb-1">Total Revenue</div>
                        <div class="h3 fw-bold text-white mb-0">$42,850.00</div>
                        <div class="text-dim opacity-50 small mt-2">Projection: $45,000</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="rounded-circle p-2" style="background: rgba(0, 210, 255, 0.1);">
                                <i class="bi bi-ticket-perforated fs-4 text-white"
                                    style="color: var(--neon-cyan) !important;"></i>
                            </div>
                            <span class="badge rounded-pill bg-danger bg-opacity-10 text-danger small">-3.2%</span>
                        </div>
                        <div class="text-dim small text-uppercase fw-bold tracking-wider mb-1">Total Tickets</div>
                        <div class="h3 fw-bold text-white mb-0">1,248</div>
                        <div class="text-dim opacity-50 small mt-2">Avg: 120/day</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="rounded-circle p-2" style="background: rgba(114, 16, 241, 0.1);">
                                <i class="bi bi-person-check fs-4 text-white"
                                    style="color: var(--secondary-accent) !important;"></i>
                            </div>
                            <span class="badge rounded-pill bg-success bg-opacity-10 text-success small">+8.1%</span>
                        </div>
                        <div class="text-dim small text-uppercase fw-bold tracking-wider mb-1">New Users</div>
                        <div class="h3 fw-bold text-white mb-0">342</div>
                        <div class="text-dim opacity-50 small mt-2">Target: 400</div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="rounded-circle p-2" style="background: rgba(255, 255, 255, 0.1);">
                                <i class="bi bi-display fs-4 text-white"></i>
                            </div>
                            <span class="badge rounded-pill bg-info bg-opacity-10 text-info small">Optimal</span>
                        </div>
                        <div class="text-dim small text-uppercase fw-bold tracking-wider mb-1">Network Status</div>
                        <div class="h3 fw-bold text-white mb-0">99.9%</div>
                        <div class="text-dim opacity-50 small mt-2">Latency: 24ms</div>
                    </div>
                </div>
            </div>

            <!-- Charts Section -->
            <div class="row g-4 mb-5">
                <div class="col-lg-8">
                    <div class="glass-card p-4 h-100">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h5 class="text-white fw-bold mb-0">Revenue Stream Analysis</h5>
                            <div class="dropdown">
                                <button class="btn btn-dark btn-sm rounded-pill opacity-75 border-secondary"
                                    type="button">Monthly View</button>
                            </div>
                        </div>
                        <div style="height: 350px;">
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="glass-card p-4 h-100">
                        <h5 class="text-white fw-bold mb-4">Genre Market Share</h5>
                        <div style="height: 280px; position: relative;">
                            <canvas id="genreChart"></canvas>
                            <div
                                style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -85%); text-align: center;">
                                <div class="text-dim small text-uppercase tracking-wider">Top Sector</div>
                                <div class="h3 fw-bold text-white mb-0">Action</div>
                            </div>
                        </div>
                        <div class="mt-4 pt-3 border-top border-secondary border-opacity-25">
                            <div class="d-flex justify-content-between mb-2 small text-dim">
                                <span>Primary Sector (Action)</span>
                                <span class="text-white fw-bold">35%</span>
                            </div>
                            <div class="progress" style="height: 4px; background: rgba(255,255,255,0.05);">
                                <div class="progress-bar" style="width: 35%; background: var(--primary-accent);"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Detailed Operations List -->
            <div class="glass-card mb-5 overflow-hidden">
                <div
                    class="card-header border-bottom border-secondary border-opacity-25 p-4 d-flex justify-content-between align-items-center">
                    <h5 class="text-white fw-bold mb-0">Regional Operational Status</h5>
                    <a href="#" class="btn btn-outline-primary btn-sm">Export Report</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-dark table-hover mb-0 align-middle">
                        <thead>
                            <tr>
                                <th class="ps-4">Theater Location</th>
                                <th>Status</th>
                                <th>Current Movie</th>
                                <th>Load Factor</th>
                                <th class="text-end pe-4">Revenue (Today)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="ps-4">
                                    <div class="fw-bold text-white">Kumari Kamalpokhari</div>
                                    <div class="text-dim small opacity-50">Downtown Kathmandu, City A</div>
                                </td>
                                <td><span
                                        class="badge bg-success bg-opacity-10 text-success border border-success border-opacity-25">Operational</span>
                                </td>
                                <td class="text-dim">Spider-Man: Across the Universe</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="progress flex-grow-1"
                                            style="height: 6px; background: rgba(255,255,255,0.05); max-width: 100px;">
                                            <div class="progress-bar bg-info" style="width: 82%;"></div>
                                        </div>
                                        <span class="small text-white">82%</span>
                                    </div>
                                </td>
                                <td class="text-end pe-4 text-white fw-bold">$4,250</td>
                            </tr>
                            <tr>
                                <td class="ps-4">
                                    <div class="fw-bold text-white">Big Movies</div>
                                    <div class="text-dim small opacity-50">City Center Mall, City B</div>
                                </td>
                                <td><span
                                        class="badge bg-success bg-opacity-10 text-success border border-success border-opacity-25">Operational</span>
                                </td>
                                <td class="text-dim">Inception (Re-release)</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="progress flex-grow-1"
                                            style="height: 6px; background: rgba(255,255,255,0.05); max-width: 100px;">
                                            <div class="progress-bar bg-warning" style="width: 45%;"></div>
                                        </div>
                                        <span class="small text-white">45%</span>
                                    </div>
                                </td>
                                <td class="text-end pe-4 text-white fw-bold">$2,100</td>
                            </tr>
                            <tr>
                                <td class="ps-4">
                                    <div class="fw-bold text-white">Q's Cinemas</div>
                                    <div class="text-dim small opacity-50">Rising Mall, City C</div>
                                </td>
                                <td><span
                                        class="badge bg-warning bg-opacity-10 text-warning border border-warning border-opacity-25">Maintenance</span>
                                </td>
                                <td class="text-dim">N/A</td>
                                <td>
                                    <div class="d-flex align-items-center gap-2">
                                        <div class="progress flex-grow-1"
                                            style="height: 6px; background: rgba(255,255,255,0.05); max-width: 100px;">
                                            <div class="progress-bar bg-secondary" style="width: 0%;"></div>
                                        </div>
                                        <span class="small text-white">0%</span>
                                    </div>
                                </td>
                                <td class="text-end pe-4 text-white fw-bold">$0</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Chart Implementation -->
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Revenue Line Chart
                const ctxRevenue = document.getElementById('revenueChart').getContext('2d');
                new Chart(ctxRevenue, {
                    type: 'line',
                    data: {
                        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'],
                        datasets: [{
                            label: 'Gross Revenue ($)',
                            data: [12000, 19000, 15000, 25000, 22000, 30000, 42850],
                            borderColor: '#ff007f',
                            backgroundColor: 'rgba(255, 0, 127, 0.1)',
                            fill: true,
                            tension: 0.4,
                            borderWidth: 3,
                            pointBackgroundColor: '#ffffff',
                            pointBorderColor: '#ff007f',
                            pointRadius: 5
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        plugins: {
                            legend: { labels: { color: '#b3b7d1', font: { family: 'Outfit', size: 12 } } }
                        },
                        scales: {
                            y: {
                                grid: { color: 'rgba(255, 255, 255, 0.05)' },
                                ticks: { color: '#b3b7d1' }
                            },
                            x: {
                                grid: { display: false },
                                ticks: { color: '#b3b7d1' }
                            }
                        }
                    }
                });

                // Genre Doughnut Chart
                const ctxGenre = document.getElementById('genreChart').getContext('2d');
                new Chart(ctxGenre, {
                    type: 'doughnut',
                    data: {
                        labels: ['Action', 'Drama', 'Comedy', 'Sci-Fi', 'Horror'],
                        datasets: [{
                            data: [35, 20, 15, 20, 10],
                            backgroundColor: [
                                '#ff007f',
                                '#7210f1',
                                '#00d2ff',
                                '#ffd32d',
                                '#3ae374'
                            ],
                            borderWidth: 0,
                            hoverOffset: 20
                        }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        cutout: '70%',
                        plugins: {
                            legend: {
                                position: 'bottom',
                                labels: { color: '#b3b7d1', padding: 20, font: { family: 'Outfit' } }
                            }
                        }
                    }
                });
            });
        </script>

        <style>
            .breadcrumb-item+.breadcrumb-item::before {
                color: rgba(255, 255, 255, 0.3);
            }

            .progress-bar {
                border-radius: 50px;
            }

            .progress {
                background: rgba(255, 255, 255, 0.05);
                border-radius: 50px;
            }
        </style>
    </asp:Content>