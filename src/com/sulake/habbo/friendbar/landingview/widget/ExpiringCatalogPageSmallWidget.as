// by nota

//com.sulake.habbo.friendbar.landingview.widget.ExpiringCatalogPageSmallWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3109;
    import _-AE._SafeStr_681;
    import _-q1n._SafeStr_174;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3314;
    import _-g1G._SafeStr_1516;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;

    public class ExpiringCatalogPageSmallWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {

        private static const REFRESH_PERIOD_IN_MILLIS:Number = 30000;

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _pageName:String = "";
        private var _lastRequestTime:Date;
        private var _SafeStr_6909:int;

        public function ExpiringCatalogPageSmallWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            _landingView = null;
            _container = null;
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("expiring_catalog_page_small"));
            _container.findChildByName("open_catalog_button").procedure = onOpenCatalogButton;
            _container.visible = false;
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_681(onCatalogPage));
        }

        public function refresh():void
        {
            if (((_lastRequestTime == null) || ((_lastRequestTime.time + 30000) < new Date().time)))
            {
                _landingView.send(new _SafeStr_174());
                _lastRequestTime = new Date();
            };
        }

        private function refreshContent():void
        {
            if (_pageName == "")
            {
                _container.visible = false;
                return;
            };
            _container.visible = true;
            _container.findChildByName("page_header_txt").caption = getText((("landing.view.pageexpiry.page." + _pageName) + ".header"));
            _container.findChildByName("page_desc_txt").caption = getText((("landing.view.pageexpiry.page." + _pageName) + ".desc"));
            var _local_1:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_container.findChildByName("promo_bitmap"));
            _local_1.assetUri = (("${image.library.url}reception/catalog_teaser_" + _pageName) + ".png");
            refreshTimer();
        }

        private function getText(_arg_1:String):String
        {
            return (("${" + _arg_1) + "}");
        }

        private function onOpenCatalogButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.catalog.openCatalogPage(_pageName);
                _landingView.tracking.trackGoogle("landingView", "click_goToExpiringCatalogPage");
            };
        }

        public function get disposed():Boolean
        {
            return (_landingView == null);
        }

        private function refreshTimer():void
        {
            var _local_1:_SafeStr_3199 = _SafeStr_3199(_container.findChildByName("countdown_widget"));
            var _local_2:_SafeStr_3314 = _SafeStr_3314(_local_1.widget);
            _local_2.seconds = _SafeStr_6909;
        }

        private function onCatalogPage(_arg_1:IMessageEvent):void
        {
            var _local_2:_SafeStr_1516 = _SafeStr_1516(_arg_1.parser);
            _pageName = _local_2.pageName;
            _SafeStr_6909 = _local_2.secondsToExpiry;
            refreshContent();
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_1516 = "_-8l" (String#22278, DoABC#4)
// _SafeStr_174 = "_-zd" (String#18285, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3314 = "_-j1a" (String#3394, DoABC#4)
// _SafeStr_681 = "_-xS" (String#18591, DoABC#4)
// _SafeStr_6909 = "_-6Q" (String#9227, DoABC#4)


