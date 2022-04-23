// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.friendbar.landingview.widget.NextLimitedRareCountdownWidget

package com.sulake.habbo.friendbar.landingview.widget
{
    import com.sulake.habbo.friendbar.landingview.interfaces.ILandingViewWidget;
    import com.sulake.habbo.session.product._SafeStr_1706;
    import com.sulake.habbo.friendbar.landingview.interfaces.ISettingsAwareWidget;
    import com.sulake.habbo.friendbar.landingview.HabboLandingView;
    import com.sulake.core.window._SafeStr_3133;
    import flash.utils.Timer;
    import _-AE._SafeStr_692;
    import _-q1n._SafeStr_403;
    import flash.events.TimerEvent;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window.components._SafeStr_3199;
    import com.sulake.habbo.window.widgets._SafeStr_3314;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.habbo.friendbar.landingview.layout.WidgetContainerLayout;
    import com.sulake.habbo.friendbar.landingview.layout.CommonWidgetSettings;

    public class NextLimitedRareCountdownWidget implements ILandingViewWidget, _SafeStr_1706, ISettingsAwareWidget 
    {

        private static const REFRESH_PERIOD_IN_MILLIS:Number = 30000;

        private var _landingView:HabboLandingView;
        private var _container:_SafeStr_3133;
        private var _SafeStr_6942:int = 0;
        private var _SafeStr_4786:int;
        private var _offerId:int;
        private var _SafeStr_4890:String;
        private var _lastRequestTime:Date;
        private var _SafeStr_6941:Timer;

        public function NextLimitedRareCountdownWidget(_arg_1:HabboLandingView)
        {
            _landingView = _arg_1;
        }

        public function dispose():void
        {
            if (!disposed)
            {
                if (_SafeStr_6941 != null)
                {
                    _SafeStr_6941.stop();
                    _SafeStr_6941 = null;
                };
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
            _container = _SafeStr_3133(_landingView.getXmlWindow("next_ltd_available"));
            _container.findChildByName("get").procedure = onOpenCatalogButton;
            _container.findChildByName("catalogue_button").procedure = onOpenCatalogButton;
            _container.visible = false;
            _landingView.communicationManager.addHabboConnectionMessageEvent(new _SafeStr_692(onLimitedOfferAppearingNextMessage));
            requestLimitedOfferAppearingNextMessage(null);
        }

        private function requestLimitedOfferAppearingNextMessage(_arg_1:TimerEvent):void
        {
            if (!_landingView.getBoolean("next.limited.rare.countdown.widget.disabled"))
            {
                _landingView.communicationManager.connection.send(new _SafeStr_403());
            };
        }

        public function refresh():void
        {
            if (((_lastRequestTime == null) || ((_lastRequestTime.time + 30000) < new Date().time)))
            {
                requestLimitedOfferAppearingNextMessage(null);
                _lastRequestTime = new Date();
            };
        }

        public function get container():_SafeStr_3109
        {
            return (_container);
        }

        public function productDataReady():void
        {
            refreshContent();
        }

        private function refreshContent():void
        {
            if (disposed)
            {
                return;
            };
            if (_landingView.getProductData(_SafeStr_4890, this) != null)
            {
                _container.findChildByName("get").caption = _landingView.getProductData(_SafeStr_4890, this).name;
            };
            if (_SafeStr_4786 >= 0)
            {
                _container.visible = true;
                _container.findChildByName("get").visible = true;
                _container.findChildByName("countdown").visible = false;
            }
            else
            {
                if (_SafeStr_6942 > 0)
                {
                    _container.visible = true;
                    _container.findChildByName("get").visible = false;
                    _container.findChildByName("countdown").visible = true;
                }
                else
                {
                    _container.visible = false;
                };
            };
            refreshTimer();
        }

        private function refreshTimer():void
        {
            var _local_1:_SafeStr_3199 = _SafeStr_3199(_container.findChildByName("countdown"));
            var _local_2:_SafeStr_3314 = _SafeStr_3314(_local_1.widget);
            _local_2.seconds = _SafeStr_6942;
            _local_2.running = true;
        }

        private function setModeSwitchTimer(_arg_1:int):void
        {
            if (_arg_1 <= 0)
            {
                return;
            };
            if (_SafeStr_6941 != null)
            {
                _SafeStr_6941.stop();
                _SafeStr_6941 = null;
            };
            _SafeStr_6941 = new Timer(((_arg_1 + 1) * 1000), 1);
            _SafeStr_6941.addEventListener("timer", requestLimitedOfferAppearingNextMessage);
            _SafeStr_6941.start();
        }

        private function onLimitedOfferAppearingNextMessage(_arg_1:_SafeStr_692):void
        {
            _SafeStr_6942 = _arg_1.getParser().appearsInSeconds;
            _SafeStr_4786 = _arg_1.getParser().pageId;
            _offerId = _arg_1.getParser().offerId;
            _SafeStr_4890 = _arg_1.getParser().productType;
            refreshContent();
            setModeSwitchTimer(_SafeStr_6942);
        }

        private function onOpenCatalogButton(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (_arg_1.type == "WME_CLICK")
            {
                _landingView.catalog.openCatalogPageById(_SafeStr_4786, _offerId, "NORMAL");
                _landingView.tracking.trackGoogle("landingView", "click_goToNextLimitedCatalogPage");
            };
        }

        public function set settings(_arg_1:CommonWidgetSettings):void
        {
            WidgetContainerLayout.applyCommonWidgetSettings(_container, _arg_1);
        }


    }
}//package com.sulake.habbo.friendbar.landingview.widget

// _SafeStr_1706 = "_-817" (String#5080, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3199 = "_-Z1u" (String#359, DoABC#4)
// _SafeStr_3314 = "_-j1a" (String#3394, DoABC#4)
// _SafeStr_403 = "_-YM" (String#28999, DoABC#4)
// _SafeStr_4786 = "_-l1k" (String#2541, DoABC#4)
// _SafeStr_4890 = "_-91L" (String#3158, DoABC#4)
// _SafeStr_692 = "_-41f" (String#24433, DoABC#4)
// _SafeStr_6941 = "_-5Y" (String#5577, DoABC#4)
// _SafeStr_6942 = "_-i1r" (String#13384, DoABC#4)


