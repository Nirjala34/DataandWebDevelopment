<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Data_and_Web_Development_Final.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main class="container py-5">
        <div class="text-center mb-5">
            <h1 class="display-4 fw-bold" style="letter-spacing: 2px;">GET IN <span style="color: var(--neon-cyan); text-shadow: 0 0 15px rgba(0, 210, 255, 0.5);">TOUCH</span></h1>
            <p class="lead mt-3" style="color: var(--text-dim); max-width: 600px; margin: 0 auto;">Have a question about a screening, booking, or simply want to say hello? Drop us a line below.</p>
        </div>

        <div class="row g-5">
            <div class="col-lg-5">
                <div class="glass-card p-5 h-100" style="background: linear-gradient(135deg, rgba(25, 25, 45, 0.8) 0%, rgba(15, 15, 25, 0.9) 100%);">
                    <h3 class="fw-bold mb-4" style="color: #ffffff;">Contact Information</h3>
                    <p style="color: var(--text-dim); margin-bottom: 2rem;">We are here to help and answer any questions you might have. We look forward to hearing from you.</p>

                    <div class="d-flex align-items-start mb-4">
                        <div class="me-3 mt-1 p-2 rounded" style="background: rgba(255, 0, 127, 0.1);">
                            <i class="bi bi-geo-alt-fill" style="color: var(--primary-accent); font-size: 1.2rem;"></i>
                        </div>
                        <div>
                            <h5 class="fw-bold mb-1" style="font-size: 1.1rem;">Location</h5>
                            <p style="color: var(--text-dim); margin: 0;">Newroad, Pokhara</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-start mb-4">
                        <div class="me-3 mt-1 p-2 rounded" style="background: rgba(114, 16, 241, 0.1);">
                            <i class="bi bi-telephone-fill" style="color: var(--secondary-accent); font-size: 1.2rem;"></i>
                        </div>
                        <div>
                            <h5 class="fw-bold mb-1" style="font-size: 1.1rem;">Phone</h5>
                            <p style="color: var(--text-dim); margin: 0;">9842277671</p>
                        </div>
                    </div>

                    <div class="d-flex align-items-start">
                        <div class="me-3 mt-1 p-2 rounded" style="background: rgba(0, 210, 255, 0.1);">
                            <i class="bi bi-envelope-fill" style="color: var(--neon-cyan); font-size: 1.2rem;"></i>
                        </div>
                        <div>
                            <h5 class="fw-bold mb-1" style="font-size: 1.1rem;">Email</h5>
                            <p style="color: var(--text-dim); margin: 0;">pratistha708@gmail.com</p>
                        </div>
                    </div>
                    
                    <hr style="border-top: 1px solid rgba(255,255,255,0.1); margin: 2rem 0;" />
                    
                    <h5 class="fw-bold mb-3" style="font-size: 1.1rem;">Connect With Us</h5>
                    <div class="d-flex gap-3">
                        <a href="https://www.facebook.com/" target="_blank" class="btn btn-outline-primary" style="padding: 10px !important; width: 45px; height: 45px; border-radius: 50% !important; display: inline-flex; justify-content: center; align-items: center;"><i class="bi bi-facebook" style="font-size: 1.2rem;"></i></a>
                        <a href="https://www.linkedin.com/" target="_blank" class="btn btn-outline-primary" style="padding: 10px !important; width: 45px; height: 45px; border-radius: 50% !important; border-color: var(--secondary-accent) !important; color: var(--secondary-accent) !important; display: inline-flex; justify-content: center; align-items: center;"><i class="bi bi-linkedin" style="font-size: 1.2rem;"></i></a>
                        <a href="https://www.instagram.com/" target="_blank" class="btn btn-outline-primary" style="padding: 10px !important; width: 45px; height: 45px; border-radius: 50% !important; border-color: var(--neon-cyan) !important; color: var(--neon-cyan) !important; display: inline-flex; justify-content: center; align-items: center;"><i class="bi bi-instagram" style="font-size: 1.2rem;"></i></a>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-7">
                <div class="glass-card p-5 h-100" style="position: relative; overflow: hidden;">
                    <div style="position: absolute; top: -50px; right: -50px; width: 200px; height: 200px; background: var(--secondary-accent); filter: blur(100px); opacity: 0.15; border-radius: 50%; pointer-events: none;"></div>
                    
                    <h3 class="fw-bold mb-4">Send a Message</h3>
                    
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label" style="color: var(--text-dim); font-size: 0.9rem;">Your Name</label>
                            <input type="text" class="form-control bg-transparent text-white" style="border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 12px; transition: border-color 0.3s ease;" placeholder="John Doe" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label" style="color: var(--text-dim); font-size: 0.9rem;">Email Address</label>
                            <input type="email" class="form-control bg-transparent text-white" style="border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 12px; transition: border-color 0.3s ease;" placeholder="john@example.com" />
                        </div>
                        <div class="col-12 mt-4">
                            <label class="form-label" style="color: var(--text-dim); font-size: 0.9rem;">Subject</label>
                            <input type="text" class="form-control bg-transparent text-white" style="border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 12px; transition: border-color 0.3s ease;" placeholder="How can we help?" />
                        </div>
                        <div class="col-12 mt-4">
                            <label class="form-label" style="color: var(--text-dim); font-size: 0.9rem;">Message</label>
                            <textarea rows="5" class="form-control bg-transparent text-white" style="border: 1px solid rgba(255,255,255,0.1); border-radius: 8px; padding: 12px; transition: border-color 0.3s ease;" placeholder="Write your message here..."></textarea>
                        </div>
                        <div class="col-12 mt-4 text-end">
                            <button type="button" class="btn btn-primary" style="padding: 12px 30px !important; letter-spacing: 2px;">SEND MESSAGE</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <style>
            .form-control:focus {
                border-color: var(--primary-accent) !important;
                box-shadow: 0 0 0 0.25rem rgba(255, 0, 127, 0.15) !important;
                background-color: rgba(255, 255, 255, 0.05) !important;
            }
            .form-control::placeholder {
                color: rgba(255, 255, 255, 0.3);
            }
        </style>
    </main>
</asp:Content>













