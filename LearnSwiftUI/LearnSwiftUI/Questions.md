#  Questions

- State object vs observable better for viewModel


- Better solution creating navigation than switch case
- Navigate from profile menu innerview to other side menu inner view for example library menu last menu point
- Navigation like push or present, in a central place (composition root) 
- Refresh loaded screen if next screen change something (notify previous screen about the change), for example call api user detail because in new view changed some data and previous screen also used user detail
- SwiftUI when need appdelegate
- Better method for create custom menu layer two sidemenus(left-right), topbar, center part. Side menus need over the center part(Z index)
- Factory in swiftUI, 
- DI container?? lots of service??


App start -> checking token: - none or expired -> Login -> LoaderStart -> ContentView
                             - validRefresh or validAccess -> LoaderStart  -> ContentView
In LoaderStart loading necesarry data via Api. than loading main content view. Is there better way in swiftui?                        


