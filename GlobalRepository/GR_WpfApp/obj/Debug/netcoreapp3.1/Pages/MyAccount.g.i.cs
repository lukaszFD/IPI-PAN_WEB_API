﻿#pragma checksum "..\..\..\..\Pages\MyAccount.xaml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "9947E74FB18A34113532B28B135AA81BAE2FCB72"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.42000
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using GR_WpfApp.Pages;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Controls.Ribbon;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace GR_WpfApp.Pages {
    
    
    /// <summary>
    /// MyAccount
    /// </summary>
    public partial class MyAccount : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 50 "..\..\..\..\Pages\MyAccount.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DataGrid dataGirdAccount;
        
        #line default
        #line hidden
        
        
        #line 75 "..\..\..\..\Pages\MyAccount.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button accountButton;
        
        #line default
        #line hidden
        
        
        #line 121 "..\..\..\..\Pages\MyAccount.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox loginTbx;
        
        #line default
        #line hidden
        
        
        #line 137 "..\..\..\..\Pages\MyAccount.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox passwordTbx;
        
        #line default
        #line hidden
        
        
        #line 176 "..\..\..\..\Pages\MyAccount.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox urlTbx;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.8.1.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/GR_WpfApp;component/pages/myaccount.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\..\Pages\MyAccount.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.8.1.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.dataGirdAccount = ((System.Windows.Controls.DataGrid)(target));
            return;
            case 2:
            this.accountButton = ((System.Windows.Controls.Button)(target));
            
            #line 77 "..\..\..\..\Pages\MyAccount.xaml"
            this.accountButton.Click += new System.Windows.RoutedEventHandler(this.accountButton_Click);
            
            #line default
            #line hidden
            return;
            case 3:
            this.loginTbx = ((System.Windows.Controls.TextBox)(target));
            return;
            case 4:
            this.passwordTbx = ((System.Windows.Controls.TextBox)(target));
            return;
            case 5:
            this.urlTbx = ((System.Windows.Controls.TextBox)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}

