<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Data_and_Web_Development_Final._Default" %>

    <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <style>
            .hero-banner {
                background: linear-gradient(135deg, rgba(255, 0, 127, 0.1), rgba(114, 16, 241, 0.15));
                backdrop-filter: blur(25px);
                border: 1px solid rgba(255, 255, 255, 0.1);
                color: #ffffff;
                padding: 5rem 2rem;
                border-radius: 24px;
                margin-bottom: 4rem;
                box-shadow: 0 30px 60px rgba(0, 0, 0, 0.5), 0 0 40px rgba(255, 0, 127, 0.1);
                position: relative;
                overflow: hidden;
            }

            .hero-banner h1 {
                font-size: 3.5rem;
                font-weight: 800;
                letter-spacing: -1px;
                background: linear-gradient(135deg, #ffffff, #ff007f);
                -webkit-background-clip: text;
                background-clip: text;
                -webkit-text-fill-color: transparent;
                position: relative;
                z-index: 1;
            }

            .card-menu {
                transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
                border: 1px solid rgba(255, 255, 255, 0.08) !important;
                border-radius: 20px !important;
                background: rgba(255, 255, 255, 0.03) !important;
                backdrop-filter: blur(15px);
                height: 100%;
                overflow: hidden;
            }

            .card-menu:hover {
                transform: translateY(-12px);
                background: rgba(255, 255, 255, 0.06) !important;
                border-color: var(--primary-accent) !important;
                box-shadow: 0 40px 80px rgba(0, 0, 0, 0.7), 0 0 20px rgba(255, 0, 127, 0.2);
            }

            .icon-box-wrapper {
                position: relative;
                width: 90px;
                height: 90px;
                margin: 0 auto 2.5rem;
                transition: transform 0.4s ease;
            }

            .icon-box {
                width: 100%;
                height: 100%;
                border-radius: 18px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                font-size: 0.8rem;
                font-weight: 800;
                color: #ffffff;
                text-transform: uppercase;
                letter-spacing: 1.5px;
                background: linear-gradient(135deg, var(--primary-accent), var(--secondary-accent));
                box-shadow: 0 15px 30px rgba(255, 0, 127, 0.4);
                border: 1px solid rgba(255, 255, 255, 0.2);
            }

            .icon-accent-cyan {
                background: linear-gradient(135deg, #00d2ff, #008cff);
                box-shadow: 0 15px 30px rgba(0, 210, 255, 0.4);
            }

            .icon-accent-purple {
                background: linear-gradient(135deg, #7210f1, #9d50bb);
                box-shadow: 0 15px 30px rgba(114, 16, 241, 0.4);
            }

            .section-title {
                color: #ffffff;
                font-weight: 800;
                font-size: 2rem;
                margin-bottom: 3rem;
                display: flex;
                align-items: center;
                gap: 20px;
                letter-spacing: -0.5px;
            }

            .section-title::after {
                content: '';
                flex: 1;
                height: 2px;
                background: linear-gradient(to right, var(--primary-accent), transparent);
                opacity: 0.5;
            }
        </style>

        <main class="py-4">
            <div class="hero-banner text-center">
                <h1 class="text-uppercase" style="letter-spacing: 2px;">Cinema Management Systems</h1>
                <p class="lead mt-3"
                    style="color: var(--text-dim); font-weight: 400; font-size: 1.1rem; max-width: 700px; margin: 0 auto;">
                    Professional administration suite for theater operations, scheduling, and real-time attendance
                    analytics.
                </p>
            </div>

            <div class="row g-4 mb-5 text-center">
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card border-0 shadow-lg">
                        <div class="mb-2"><i class="bi bi-people fs-3" style="color: var(--primary-accent);"></i></div>
                        <h2 class="fw-bold text-white mb-1">
                            <%= UserCount %>
                        </h2>
                        <p class="text-dim mb-0 small text-uppercase tracking-wider">Active Users</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card border-0 shadow-lg">
                        <div class="mb-2"><i class="bi bi-building fs-3" style="color: var(--primary-accent);"></i>
                        </div>
                        <h2 class="fw-bold text-white mb-1">
                            <%= TheaterCount %>
                        </h2>
                        <p class="text-dim mb-0 small text-uppercase tracking-wider">Theaters</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card border-0 shadow-lg">
                        <div class="mb-2"><i class="bi bi-film fs-3" style="color: var(--primary-accent);"></i></div>
                        <h2 class="fw-bold text-white mb-1">
                            <%= MovieCount %>
                        </h2>
                        <p class="text-dim mb-0 small text-uppercase tracking-wider">Movies Screened</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="glass-card p-4 hover-card"
                        style="border: 1px solid rgba(212, 175, 55, 0.2) !important;">
                        <div class="mb-2"><i class="bi bi-cpu fs-4" style="color: var(--primary-accent);"></i></div>
                        <h4 class="text-white mb-1 fw-bold">ONLINE</h4>
                        <p class="text-dim mb-0 small text-uppercase tracking-wider">System Status</p>
                    </div>
                </div>
            </div>

            <!-- Management Hub -->
            <div class="row g-4 mb-5">
                <div class="col-lg-6">
                    <div class="glass-card p-5 h-100 hover-card border-0 shadow-lg"
                        style="background: linear-gradient(135deg, rgba(212, 175, 55, 0.05), transparent) !important;">
                        <h4 class="text-white fw-bold mb-3"><i class="bi bi-gear-fill me-2"
                                style="color: var(--primary-accent);"></i>
                            Core Administration</h4>
                        <p class="text-dim mb-4" style="font-size: 0.95rem;">Manage cinematic infrastructure with
                            precision. Access theater
                            mappings, movie scheduling, and real-time inventory control modules.</p>
                        <div class="d-flex gap-2 flex-wrap">
                            <a href="Theaters Details.aspx" class="btn btn-primary btn-sm px-4">THEATERS</a>
                            <a href="Halls Details.aspx" class="btn btn-primary btn-sm px-4">HALLS</a>
                            <a href="Movies Details.aspx" class="btn btn-primary btn-sm px-4">MOVIES</a>
                            <a href="Showtimes Details.aspx" class="btn btn-primary btn-sm px-4">SCHEDULES</a>
                            <a href="Bookings Details.aspx" class="btn btn-primary btn-sm px-4">BOOKINGS</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="glass-card p-5 h-100 hover-card border-0 shadow-lg"
                        style="background: linear-gradient(135deg, rgba(255, 255, 255, 0.03), transparent) !important;">
                        <h4 class="text-white fw-bold mb-3"><i class="bi bi-shield-lock-fill me-2"
                                style="color: var(--primary-accent);"></i>
                            Security & Audits</h4>
                        <p class="text-dim mb-4" style="font-size: 0.95rem;">Monitor system-wide security protocols and
                            reconcile ticket
                            transactions. Ensure data integrity across all distributed nodes.</p>
                        <div class="d-flex gap-3">
                            <a href="Ticket Details.aspx" class="btn btn-primary btn-sm px-4">AUDIT
                                LOGS</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Welcoming Message Section -->
            <div class="text-center mb-5">
                <div class="glass-card d-inline-block px-5 py-4 shadow-lg"
                    style="border: 1px solid rgba(212, 175, 55, 0.1) !important;">
                    <h1 class="display-6 fw-bold text-white mb-0">Welcome, <span
                            style="color: var(--primary-accent);">Administrator</span></h1>
                    <div class="mt-3 text-dim opacity-75 small text-uppercase tracking-wider">
                        <i class="bi bi-clock me-2"></i> SYSTEM TIME: <%= DateTime.Now.ToString("HH:mm") %> | <i
                                class="bi bi-shield-check me-2 ms-3"></i> ENCRYPTED SESSION
                    </div>
                </div>
            </div>

            <h2 class="section-title">
                <i class="bi bi-graph-up" style="color: var(--primary-accent);"></i>
                Operational Intelligence
            </h2>

            <div class="row g-4 mb-5">
                <div class="col-md-4">
                    <a href="UserTicket.aspx" class="text-decoration-none">
                        <div class="card card-menu shadow-lg">
                            <div class="card-body text-center p-5">
                                <div class="icon-box-wrapper">
                                    <div class="icon-box">
                                        <i class="bi bi-person-badge fs-2 mb-1"></i>
                                        Profiles
                                    </div>
                                </div>
                                <h5 class="card-title fw-bold text-white mb-3">User Tickets</h5>
                                <p class="card-text text-dim" style="font-size: 0.9rem; line-height: 1.6;">Track
                                    purchasing behavior and detailed ticket history for customers within a moving
                                    6-month
                                    window.</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="TheaterMovie.aspx" class="text-decoration-none">
                        <div class="card card-menu shadow-lg">
                            <div class="card-body text-center p-5">
                                <div class="icon-box-wrapper">
                                    <div class="icon-box icon-accent-cyan">
                                        <i class="bi bi-map fs-2 mb-1"></i>
                                        Network
                                    </div>
                                </div>
                                <h5 class="card-title fw-bold text-white mb-3">Theater Movies</h5>
                                <p class="card-text text-dim" style="font-size: 0.9rem; line-height: 1.6;">Synchronize
                                    movie catalogs and performance metrics across the geographic theater network
                                    mapping.</p>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="MovieOccupancy.aspx" class="text-decoration-none">
                        <div class="card card-menu shadow-lg">
                            <div class="card-body text-center p-5">
                                <div class="icon-box-wrapper">
                                    <div class="icon-box icon-accent-purple">
                                        <i class="bi bi-graph-up-arrow fs-2 mb-1"></i>
                                        Traffic
                                    </div>
                                </div>
                                <h5 class="card-title fw-bold text-white mb-3">Max Occupancy</h5>
                                <p class="card-text text-dim" style="font-size: 0.9rem; line-height: 1.6;">Real-time
                                    statistical seat saturation and paid attendance ratios for specific operational
                                    showtimes.
                                </p>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </main>
    </asp:Content>