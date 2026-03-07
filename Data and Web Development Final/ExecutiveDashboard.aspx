<%@ Page Title="Executive Dashboard" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="ExecutiveDashboard.aspx.cs" Inherits="Data_and_Web_Development_Final.ExecutiveDashboard" %>

    <asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container py-4">
            <div class="d-flex justify-content-between align-items-end mb-5" data-aos="fade-down">
                <div>
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-2">
                            <li class="breadcrumb-item"><a href="Default.aspx" class="text-dim">Home</a></li>
                            <li class="breadcrumb-item active text-white" aria-current="page">Executive Dashboard</li>
                        </ol>
                    </nav>
                    <h1 class="fw-bold text-white mb-0">Executive <span class="text-primary-accent">Intelligence</span>
                    </h1>
                    <p class="text-dim mb-0">Comprehensive multi-dimensional analysis of cinema operations</p>
                </div>
                <div class="text-end">
                    <button class="btn btn-outline-primary btn-sm me-2"><i class="bi bi-download me-1"></i> Export
                        PDF</button>
                    <button class="btn btn-primary btn-sm"><i class="bi bi-printer me-1"></i> Print Report</button>
                </div>
            </div>

            <!-- Metric Cards -->
            <div class="row g-4 mb-5">
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="100">
                    <div class="glass-card p-4 h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="p-2 rounded bg-primary-accent bg-opacity-10">
                                <i class="bi bi-currency-dollar text-primary-accent fs-4"></i>
                            </div>
                            <span class="badge bg-success bg-opacity-10 text-success text-xs">+12.5%</span>
                        </div>
                        <h3 class="fw-bold text-white mb-1">
                            <%= RevenueDisplay %>
                        </h3>
                        <p class="text-dim small mb-0">Total Revenue</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="200">
                    <div class="glass-card p-4 h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="p-2 rounded bg-info bg-opacity-10">
                                <i class="bi bi-ticket-perforated text-info fs-4"></i>
                            </div>
                            <span class="badge bg-success bg-opacity-10 text-success text-xs">+8.2%</span>
                        </div>
                        <h3 class="fw-bold text-white mb-1">
                            <%= TotalTickets %>
                        </h3>
                        <p class="text-dim small mb-0">Tickets Sold</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="300">
                    <div class="glass-card p-4 h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="p-2 rounded bg-warning bg-opacity-10">
                                <i class="bi bi-people text-warning fs-4"></i>
                            </div>
                            <span class="badge bg-danger bg-opacity-10 text-danger text-xs">-2.1%</span>
                        </div>
                        <h3 class="fw-bold text-white mb-1">
                            <%= UserTotal %>
                        </h3>
                        <p class="text-dim small mb-0">Users Registered</p>
                    </div>
                </div>
                <div class="col-md-3" data-aos="fade-up" data-aos-delay="400">
                    <div class="glass-card p-4 h-100">
                        <div class="d-flex justify-content-between align-items-start mb-3">
                            <div class="p-2 rounded bg-neon-cyan bg-opacity-10">
                                <i class="bi bi-stars text-neon-cyan fs-4"></i>
                            </div>
                            <span class="badge bg-success bg-opacity-10 text-success text-xs">+15.4%</span>
                        </div>
                        <h3 class="fw-bold text-white mb-1">
                            <%= OccupancyRate %>
                        </h3>
                        <p class="text-dim small mb-0">Real-Time Occupancy</p>
                    </div>
                </div>
            </div>

            <div class="row g-4 mb-5">
                <!-- Revenue Over Time -->
                <div class="col-lg-8" data-aos="fade-right">
                    <div class="glass-card p-4 h-100">
                        <h5 class="fw-bold text-white mb-4"><i class="bi bi-graph-up me-2 text-primary-accent"></i>
                            Revenue Projection & Historical Analysis</h5>
                        <div style="height: 350px;">
                            <canvas id="revenueChart"></canvas>
                        </div>
                    </div>
                </div>
                <!-- Popular Genres -->
                <div class="col-lg-4" data-aos="fade-left">
                    <div class="glass-card p-4 h-100">
                        <h5 class="fw-bold text-white mb-4"><i class="bi bi-pie-chart me-2 text-info"></i> Audience
                            Preference</h5>
                        <div style="height: 350px;">
                            <canvas id="genreChart"></canvas>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <!-- Top Performing Theaters -->
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="100">
                    <div class="glass-card p-4 h-100">
                        <h5 class="fw-bold text-white mb-4"><i class="bi bi-building me-2 text-warning"></i> Active
                            Theater Leaderboard</h5>
                        <div class="table-responsive">
                            <table class="table table-borderless table-hover mb-0 text-white">
                                <thead class="text-dim uppercase x-small fw-bold">
                                    <tr>
                                        <th>Rank</th>
                                        <th>Theater Name</th>
                                        <th>ID</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% if (TopTheaters !=null && TopTheaters.Rows.Count> 0) {
                                        int rank = 1;
                                        foreach (System.Data.DataRow row in TopTheaters.Rows) { %>
                                        <tr>
                                            <td>#<%= rank++ %>
                                            </td>
                                            <td class="fw-bold">
                                                <%= row["NAME"] %>
                                            </td>
                                            <td>
                                                <%= row["THEATERID"] %>
                                            </td>
                                            <td><span class="badge bg-success bg-opacity-10 text-success">Online</span>
                                            </td>
                                        </tr>
                                        <% } } else { %>
                                            <tr>
                                                <td colspan="4" class="text-center py-4">No theater data available</td>
                                            </tr>
                                            <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Recent Feedback -->
                <div class="col-md-6" data-aos="fade-up" data-aos-delay="200">
                    <div class="glass-card p-4 h-100">
                        <h5 class="fw-bold text-white mb-4"><i class="bi bi-chat-left-dots me-2 text-neon-cyan"></i>
                            Critical Operations Alerts</h5>
                        <div class="list-group list-group-flush bg-transparent">
                            <div
                                class="list-group-item bg-transparent text-white border-secondary border-opacity-25 px-0 py-3">
                                <div class="d-flex w-100 justify-content-between mb-1">
                                    <h6 class="mb-1 text-danger fw-bold"><i
                                            class="bi bi-exclamation-triangle-fill me-2"></i> Projector Maintenance Due
                                    </h6>
                                    <small class="text-dim">3h ago</small>
                                </div>
                                <p class="mb-1 small text-dim">Kumari Hall 2 projector laser unit reaching end of life
                                    cycle. Recommendation: Replace within 48 hours.</p>
                            </div>
                            <div
                                class="list-group-item bg-transparent text-white border-secondary border-opacity-25 px-0 py-3">
                                <div class="d-flex w-100 justify-content-between mb-1">
                                    <h6 class="mb-1 text-success fw-bold"><i class="bi bi-check-circle-fill me-2"></i>
                                        Server Sync Complete</h6>
                                    <small class="text-dim">5h ago</small>
                                </div>
                                <p class="mb-1 small text-dim">All theater data successfully synchronized with central
                                    hub.</p>
                            </div>
                            <div
                                class="list-group-item bg-transparent text-white border-secondary border-opacity-25 px-0 py-3">
                                <div class="d-flex w-100 justify-content-between mb-1">
                                    <h6 class="mb-1 text-warning fw-bold"><i class="bi bi-info-circle-fill me-2"></i>
                                        Low Concession Stock</h6>
                                    <small class="text-dim">12h ago</small>
                                </div>
                                <p class="mb-1 small text-dim">Gwen Cinema reporting low inventory on Caramel Popcorn
                                    units.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

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
                            borderColor: '#f11075',
                            backgroundColor: 'rgba(241, 16, 117, 0.1)',
                            fill: true,
                            tension: 0.4,
                            borderWidth: 3,
                            pointBackgroundColor: '#ffffff',
                            pointBorderColor: '#f11075',
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
                                '#f11075',
                                '#7210f1',
                                '#00f2fe',
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
            .text-xs {
                font-size: 0.75rem;
            }

            .uppercase {
                text-transform: uppercase;
            }

            .x-small {
                font-size: 0.7rem;
            }

            .breadcrumb-item+.breadcrumb-item::before {
                color: rgba(255, 255, 255, 0.3);
            }
        </style>
    </asp:Content>