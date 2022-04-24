// by nota

//com.sulake.habbo.friendbar.landingview.widget.CatalogPromoWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.utils._SafeStr_24;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.localization.ILocalization;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;

    public class CatalogPromoWidget implements ILandingViewWidget, ISettingsAwareWidget 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _targetCatalogPageName:String;
        private var _disposed:Boolean = false;

        public function CatalogPromoWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        protected function get xmlAssetName():String
        {
            return ("catalog_promo");
        }

        public function initialize():void
        {
            var _local_2:int;
            _container = _SafeStr_3133(_landingView.getXmlWindow(xmlAssetName));
            _targetCatalogPageName = _landingView.getProperty("landing.view.catalog.promo.target");
            var _local_3:IStaticBitmapWrapperWindow = IStaticBitmapWrapperWindow(_container.findChildByName("picture"));
            _local_3.assetUri = _landingView.getProperty("landing.view.catalog.promo.image.uri");
            _container.findChildByName("open_page_button").addEventListener("WME_CLICK", onOpenPageButtonClicked);
            if (((_targetCatalogPageName == "") && (_local_3.assetUri == "")))
            {
                _container.visible = false;
            }
            else
            {
                _container.visible = true;
            };
            var _local_1:_SafeStr_24 = new _SafeStr_24();
            _local_1.add("catalog_promo_caption", "landing.view.catalog.promo.caption");
            _local_1.add("catalog_promo_info", "landing.view.catalog.promo.info");
            _local_1.add("open_page_button", "landing.view.catalog.open.page");
            _local_1.add("catalog_promo_picture_text", "landing.view.catalog.promo.picture.text");
            _local_1.add("catalog_promo_title", "landing.view.catalog.promo.title");
            _local_2 = 0;
            while (_local_2 < _local_1.length)
            {
                setCustomLocalization(_local_1.getKeys()[_local_2], _local_1.getValues()[_local_2], _targetCatalogPageName);
                _local_2++;
            };
        }

        public function refresh():void
        {
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function dispose():void
        {
            if (!disposed)
            {
                _landingView = null;
                if (_container != null)
                {
                    _container.dispose();
                    _container = null;
                };
                _disposed = true;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        private function onOpenPageButtonClicked(_arg_1:WindowMouseEvent):void
        {
            _landingView.catalog.openCatalogPage(_targetCatalogPageName);
        }

        private function setCustomLocalization(_arg_1:String, _arg_2:String, _arg_3:String):void
        {
            var _local_5:* = null;
            var _local_4:ILocalization = _landingView.localizationManager.getLocalizationRaw(((_arg_2 + ".") + _arg_3));
            if (_local_4 != null)
            {
                _local_5 = _container.findChildByName(_arg_1);
                if (_local_5 != null)
                {
                    _local_5.caption = (((("${" + _arg_2) + ".") + _arg_3) + "}");
                };
            };
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)


