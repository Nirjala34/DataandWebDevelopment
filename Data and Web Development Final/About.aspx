<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Data_and_Web_Development_Final.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <div class="text-center mb-5">
            <h1 class="display-4 fw-bold" style="letter-spacing: 2px;">DISCOVER <span style="color: var(--primary-accent); text-shadow: 0 0 15px rgba(255,0,127,0.5);">KUMARI</span> CINEMAS</h1>
            <p class="lead mt-3" style="color: var(--text-dim); max-width: 700px; margin: 0 auto;">Experience cinema like never before. Immerse yourself in the magic of storytelling with our state-of-the-art facilities and unparalleled comfort.</p>
        </div>

        <div class="row g-4 mt-4">
            <div class="col-md-4">
                <div class="glass-card hover-card h-100 p-4 text-center" style="border-top: 3px solid var(--secondary-accent);">
                    <i class="bi bi-camera-reels mb-3" style="font-size: 3rem; color: var(--secondary-accent);"></i>
                    <h3 class="h5 fw-bold text-uppercase mb-3 mt-2">Premium Screens</h3>
                    <p style="color: var(--text-dim); font-size: 0.95rem;">Crystal clear 4K laser projection paired with wall-to-wall immersive screens that transport you right into the heart of the action.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card hover-card h-100 p-4 text-center" style="border-top: 3px solid var(--primary-accent);">
                    <i class="bi bi-speaker mb-3" style="font-size: 3rem; color: var(--primary-accent);"></i>
                    <h3 class="h5 fw-bold text-uppercase mb-3 mt-2">3D Surround Sound</h3>
                    <p style="color: var(--text-dim); font-size: 0.95rem;">Feel every heartbeat and explosion with our 360-degree spatial sound systems, delivering breathtaking audio clarity and depth.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="glass-card hover-card h-100 p-4 text-center" style="border-top: 3px solid var(--neon-cyan);">
                    <i class="bi bi-star-fill mb-3" style="font-size: 3rem; color: var(--neon-cyan);"></i>
                    <h3 class="h5 fw-bold text-uppercase mb-3 mt-2">Luxurious Comfort</h3>
                    <p style="color: var(--text-dim); font-size: 0.95rem;">Relax in our signature reclining leather seats with ample legroom, ensuring your utmost comfort throughout the entire feature presentation.</p>
                </div>
            </div>
        </div>

        <div class="row mt-5 pt-5 align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0">
                <div class="glass-card p-4" style="border-left: 4px solid var(--primary-accent); position: relative; overflow: hidden;">
                    <div style="position: absolute; top: -50px; right: -50px; width: 150px; height: 150px; background: var(--primary-accent); filter: blur(80px); opacity: 0.2; border-radius: 50%;"></div>
                    <h2 class="fw-bold mb-4">Our Legacy</h2>
                    <p style="color: var(--text-dim); line-height: 1.8;">Kumari Cinemas has been a cornerstone of entertainment in the city for over two decades. What started as a single-screen theater has evolved into a premier multiplex destination.</p>
                    <p style="color: var(--text-dim); line-height: 1.8;">We are passionate about film and dedicated to providing our patrons with the ultimate movie-going experience, blending cutting-edge technology with classic hospitality.</p>
                </div>
            </div>
            <div class="col-lg-6 text-center">
                <img src="https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?q=80&w=2670&auto=format&fit=crop" alt="Cinema Interior" class="img-fluid rounded" style="border: 1px solid rgba(255,255,255,0.1); max-height: 350px; object-fit: cover; box-shadow: 0 10px 30px rgba(0,0,0,0.5);" />
            </div>
        </div>
    </main>
</asp:Content>













