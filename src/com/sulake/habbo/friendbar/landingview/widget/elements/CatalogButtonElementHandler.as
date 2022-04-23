// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.elements.CatalogButtonElementHandler

package com.sulake.habbo.friendbar.landingview.widget.elements
{
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.habbo.friendbar.landingview.widget.GenericWidget;

    public class CatalogButtonElementHandler extends _SafeStr_3494 
    {

        private var _pageName:String;


        override public function initialize(_arg_1:HabboLandingView, _arg_2:_SafeStr_3109, _arg_3:Array, _arg_4:GenericWidget):void
        {
            super.initialize(_arg_1, _arg_2, _arg_3, _arg_4);
            _pageName = _arg_3[2];
        }

        override protected function onClick():void
        {
            if (_pageName)
            {
                landingView.catalog.openCatalogPage(_pageName);
            }
            else
            {
                landingView.catalog.openCatalog();
            };
            landingView.tracking.trackGoogle("landingView", "click_genericcatalog");
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget.elements

// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3494 = "_-61h" (String#3451, DoABC#4)


