// by nota

//com.sulake.habbo.catalog.offers.OfferCenter

package com.sulake.habbo.catalog.offers
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.habbo.window._SafeStr_1695;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.catalog.IHabboCatalog;
    import com.sulake.core.window._SafeStr_3133;
    import __AS3__.vec.Vector;
    import com.sulake.core.window._SafeStr_3109;
    import flash.utils.Timer;
    import _-EK._SafeStr_613;
    import flash.events.TimerEvent;
    import _-28._SafeStr_1081;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.runtime._SafeStr_19;
    import com.sulake.core.window.components._SafeStr_3264;

    public class OfferCenter implements IOfferCenter, _SafeStr_13 
    {

        private static const PROVIDER_POLLING_FREQUENCY:int = 1800000;

        private var _disposed:Boolean;
        private var _windowManager:_SafeStr_1695;
        private var _assets:IAssetLibrary;
        private var _catalog:IHabboCatalog;
        private var _offerExtension:IOfferExtension;
        private var _window:_SafeStr_3133;
        private var _SafeStr_5183:IOfferProvider;
        private var _providers:Vector.<IOfferProvider>;
        private var _SafeStr_5185:Vector.<OfferReward>;
        private var _SafeStr_5184:_SafeStr_3109;
        private var _SafeStr_5182:Timer;
        private var _offerRewardDeliveredMessageEvent:_SafeStr_613;

        public function OfferCenter(_arg_1:_SafeStr_1695, _arg_2:IAssetLibrary, _arg_3:IHabboCatalog)
        {
            _windowManager = _arg_1;
            _assets = _arg_2;
            _catalog = _arg_3;
            _offerRewardDeliveredMessageEvent = new _SafeStr_613(onOfferRewardDelivered);
            _catalog.connection.addMessageEvent(_offerRewardDeliveredMessageEvent);
            _providers = new Vector.<IOfferProvider>(0);
            _providers.push(new SupersonicProvider(this));
            _providers.push(new SponsorPayProvider(this));
            _SafeStr_5185 = new Vector.<OfferReward>(0);
            _SafeStr_5182 = new Timer(1800000);
            _SafeStr_5182.addEventListener("timer", onPollTimer);
            _SafeStr_5182.start();
            onPollTimer(null);
        }

        private function onPollTimer(_arg_1:TimerEvent):void
        {
            if (_providers == null)
            {
                return;
            };
            for each (var _local_2:IOfferProvider in _providers)
            {
                if (_local_2.enabled)
                {
                    _local_2.load();
                };
            };
        }

        private function getNextProvider():IOfferProvider
        {
            if (_providers == null)
            {
                return (null);
            };
            for each (var _local_1:IOfferProvider in _providers)
            {
                if (((_local_1.enabled) && (_local_1.videoAvailable)))
                {
                    return (_local_1);
                };
            };
            return (null);
        }

        private function onOfferRewardDelivered(_arg_1:_SafeStr_613):void
        {
            var _local_2:_SafeStr_1081 = _arg_1.getParser();
            addReward(_local_2.name, _local_2.contentType, _local_2.classId);
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
            if (_providers != null)
            {
                for each (var _local_1:IOfferProvider in _providers)
                {
                    _local_1.dispose();
                };
                _providers = null;
            };
            if (_SafeStr_5182 != null)
            {
                _SafeStr_5182.stop();
                _SafeStr_5182 = null;
            };
            _catalog.connection.removeMessageEvent(_offerRewardDeliveredMessageEvent);
            _offerRewardDeliveredMessageEvent = null;
            _SafeStr_5185 = null;
            _offerExtension = null;
            _windowManager = null;
            _catalog = null;
            _assets = null;
            _disposed = true;
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        public function set offerExtension(_arg_1:IOfferExtension):void
        {
            _offerExtension = _arg_1;
        }

        public function showRewards():void
        {
            hide();
            _window = (_windowManager.buildFromXML((_assets.getAssetByName("offer_center_xml").content as XML)) as _SafeStr_3133);
            _window.procedure = windowProcedure;
            _window.center();
            _SafeStr_5184 = IItemListWindow(_window.findChildByName("reward_list")).removeListItemAt(0);
            populateRewardList();
        }

        public function showVideo():void
        {
            if (_SafeStr_5183 != null)
            {
                _SafeStr_5183.showVideo();
            };
        }

        public function get showingVideo():Boolean
        {
            return ((!(_SafeStr_5183 == null)) && (_SafeStr_5183.showingPopup));
        }

        private function windowProcedure(_arg_1:_SafeStr_3116, _arg_2:_SafeStr_3109):void
        {
            if (((!(_arg_1.type == "WME_CLICK")) || (!(visible))))
            {
                return;
            };
            switch (_arg_2.name)
            {
                case "header_button_close":
                    hide();
                    return;
            };
        }

        private function hide():void
        {
            if (_window != null)
            {
                _SafeStr_5184.dispose();
                _SafeStr_5184 = null;
                _window.dispose();
                _window = null;
            };
        }

        private function addReward(_arg_1:String, _arg_2:String, _arg_3:int):void
        {
            var _local_4:OfferReward = new OfferReward(_arg_1, _arg_2, _arg_3);
            _SafeStr_5185.unshift(_local_4);
            if (visible)
            {
                IItemListWindow(_window.findChildByName("reward_list")).addListItemAt(createRewardItem(_local_4), 0);
            }
            else
            {
                if (_offerExtension != null)
                {
                    _offerExtension.indicateRewards();
                };
            };
        }

        public function get configuration():_SafeStr_19
        {
            return (_catalog as _SafeStr_19);
        }

        public function updateVideoStatus():void
        {
            if (_offerExtension != null)
            {
                _SafeStr_5183 = getNextProvider();
                _offerExtension.indicateVideoAvailable(((!(_SafeStr_5183 == null)) && (_SafeStr_5183.videoAvailable)));
            };
        }

        private function populateRewardList():void
        {
            if (!visible)
            {
                return;
            };
            var _local_2:IItemListWindow = (_window.findChildByName("reward_list") as IItemListWindow);
            _local_2.destroyListItems();
            for each (var _local_1:OfferReward in _SafeStr_5185)
            {
                _local_2.addListItem(createRewardItem(_local_1));
            };
        }

        private function createRewardItem(_arg_1:OfferReward):_SafeStr_3109
        {
            var _local_2:_SafeStr_3133 = (_SafeStr_5184.clone() as _SafeStr_3133);
            _local_2.findChildByName("reward_date").caption = new Date().toLocaleString();
            _local_2.findChildByName("reward_name").caption = _arg_1.name;
            _catalog.displayProductIcon(_arg_1.contentType, _arg_1.classId, _SafeStr_3264(_local_2.findChildByName("reward_icon")));
            return (_local_2);
        }

        private function get visible():Boolean
        {
            return (((!(_window == null)) && (!(_window.disposed))) && (_window.visible));
        }

        public function showSuccess():void
        {
        }


    }
}//package com.sulake.habbo.catalog.offers

// _SafeStr_1081 = "_-a1V" (String#37099, DoABC#4)
// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1695 = "_-sN" (String#340, DoABC#4)
// _SafeStr_19 = "_-01r" (String#1323, DoABC#4)
// _SafeStr_21 = "_-61a" (String#265, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_5182 = "_-q1X" (String#3911, DoABC#4)
// _SafeStr_5183 = "_-01m" (String#7955, DoABC#4)
// _SafeStr_5184 = "_-U17" (String#10405, DoABC#4)
// _SafeStr_5185 = "_-m1D" (String#10554, DoABC#4)
// _SafeStr_613 = "_-22g" (String#20297, DoABC#4)


