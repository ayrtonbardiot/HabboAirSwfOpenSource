// by nota

//com.sulake.habbo.friendbar.landingview.widget.BonusRarePromoWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.session.product._SafeStr_1706;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.room._SafeStr_3140;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import _-AE._SafeStr_1024;
    import _-q1n._SafeStr_640;
    import com.sulake.core.window._SafeStr_3109;
    import flash.display.BitmapData;
    import com.sulake.habbo.room.events.RoomEngineEvent;
    import com.sulake.habbo.session.product._SafeStr_3182;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;

    public class BonusRarePromoWidget implements ILandingViewWidget, _SafeStr_1706, ISettingsAwareWidget, _SafeStr_3140 
    {

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_4890:String;
        private var _SafeStr_4710:int = -1;
        private var _totalCoinsForBonus:int;
        private var _SafeStr_6926:int;

        public function BonusRarePromoWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function dispose():void
        {
            if (!disposed)
            {
                _landingView.roomEngine.events.removeEventListener("REE_ENGINE_INITIALIZED", onRoomEngineInitialized);
                _landingView.communicationManager.removeHabboConnectionMessageEvent(new _SafeStr_1024(onBonusRareInfoMessage));
                _landingView = null;
                _container = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_container == null);
        }

        public function initialize():void
        {
            _container = _SafeStr_3133(_landingView.getXmlWindow("bonus_rare_promo"));
            _container.findChildByName("buy_button").procedure = onOpenCreditsPageButton;
            _container.visible = false;
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_1024(onBonusRareInfoMessage));
            _landingView.roomEngine.events.addEventListener("REE_ENGINE_INITIALIZED", onRoomEngineInitialized);
            requestBonusRareInfo();
        }

        private function requestBonusRareInfo():void
        {
            _landingView.communicationManager.connection.send(new _SafeStr_640());
        }

        public function refresh():void
        {
            requestBonusRareInfo();
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function productDataReady():void
        {
            refreshContent();
        }

        public function imageReady(_arg_1:int, _arg_2:BitmapData):void
        {
            refreshContent();
        }

        public function imageFailed(_arg_1:int):void
        {
        }

        private function onRoomEngineInitialized(_arg_1:RoomEngineEvent):void
        {
            refreshContent();
        }

        private function refreshContent():void
        {
            if (disposed)
            {
                return;
            };
            _container.visible = (!(_SafeStr_4710 == -1));
            var _local_1:_SafeStr_3182 = _landingView.getProductData(_SafeStr_4890, this);
            if (_local_1 != null)
            {
                IStaticBitmapWrapperWindow(_container.findChildByName("promo_image")).assetUri = _landingView.getProperty("landing.view.bonus.rare.image.uri");
                _container.findChildByName("header").caption = _landingView.localizationManager.getLocalizationWithParams("landing.view.bonus.rare.header", "", "rarename", _local_1.name, "amount", _totalCoinsForBonus);
                _container.findChildByName("status").caption = _landingView.localizationManager.getLocalizationWithParams("landing.view.bonus.rare.status", "", "amount", _SafeStr_6926, "total", _totalCoinsForBonus);
                setProgress((_totalCoinsForBonus - _SafeStr_6926), _totalCoinsForBonus);
            };
        }

        private function onBonusRareInfoMessage(_arg_1:_SafeStr_1024):void
        {
            _SafeStr_4890 = _arg_1.getParser().productType;
            _SafeStr_4710 = _arg_1.getParser().productClassId;
            _totalCoinsForBonus = _arg_1.getParser().totalCoinsForBonus;
            _SafeStr_6926 = _arg_1.getParser().coinsStillRequiredToBuy;
            refreshContent();
        }

        private function onOpenCreditsPageButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.tracking.trackGoogle("landingView", "click_bonusRarePromoOpenCreditsPage");
                _landingView.catalog.openCreditsHabblet();
            };
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }

        private function setProgress(_arg_1:int, _arg_2:int):void
        {
            var _local_5:int = _container.findChildByName("bar_a_bkg").width;
            var _local_4:int = _container.findChildByName("bar_a_bkg").x;
            var _local_3:int = int(((_arg_1 / _arg_2) * _local_5));
            _container.findChildByName("bar_a_c").width = _local_3;
            _container.findChildByName("bar_a_r").x = (_local_3 + _local_4);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_1024 = "_-NS" (String#14087, DoABC#4)
// _SafeStr_1706 = "_-817" (String#5080, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3140 = "_-Y1o" (String#1299, DoABC#4)
// _SafeStr_3182 = "_-Ib" (String#2336, DoABC#4)
// _SafeStr_4710 = "_-L1U" (String#4949, DoABC#4)
// _SafeStr_4890 = "_-91L" (String#3158, DoABC#4)
// _SafeStr_640 = "_-Gm" (String#30587, DoABC#4)
// _SafeStr_6926 = "_-F1P" (String#15468, DoABC#4)


