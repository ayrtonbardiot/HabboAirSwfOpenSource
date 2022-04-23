// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.catalog.targetedoffers.OfferView

package com.sulake.habbo.catalog.targetedoffers
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.habbo.catalog.targetedoffers.data.TargetedOffer;
    import flash.utils.Timer;
    import flash.events.TimerEvent;
    import com.sulake.habbo.catalog.targetedoffers.util._SafeStr_3392;
    import com.sulake.core.window.components.ITextWindow;

    public class OfferView implements _SafeStr_13 
    {

        protected var _window:_SafeStr_3133;
        protected var _SafeStr_4360:OfferController;
        protected var _offer:TargetedOffer;
        protected var _SafeStr_5305:Timer;
        protected var _disposed:Boolean;
        protected var _SafeStr_5966:String;

        public function OfferView(_arg_1:OfferController, _arg_2:TargetedOffer)
        {
            _SafeStr_4360 = _arg_1;
            _offer = _arg_2;
        }

        public function dispose():void
        {
            if (_disposed)
            {
                return;
            };
            _disposed = true;
            if (_SafeStr_5305 != null)
            {
                _SafeStr_5305.stop();
                _SafeStr_5305 = null;
            };
            if (_window != null)
            {
                _window.dispose();
                _window = null;
            };
        }

        public function get disposed():Boolean
        {
            return (_disposed);
        }

        protected function startUpdateTimer():void
        {
            _SafeStr_5305 = new Timer(1000);
            _SafeStr_5305.addEventListener("timer", onUpdateTimer);
            _SafeStr_5305.start();
            updateRemainingTime();
        }

        protected function onUpdateTimer(_arg_1:TimerEvent):void
        {
            updateRemainingTime();
        }

        protected function updateRemainingTime():void
        {
            setTimeLeft(_SafeStr_3392.getStringFromSeconds(_SafeStr_4360.catalog.localization, _offer.getSecondsRemaining()));
            if (_offer.getSecondsRemaining() == 0)
            {
                _SafeStr_4360.destroyView();
            };
        }

        protected function setTimeLeft(_arg_1:String):void
        {
            var _local_2:ITextWindow = ITextWindow(_window.findChildByName("txt_time_left"));
            if (!_local_2)
            {
                return;
            };
            _local_2.text = ((_SafeStr_5966 != "") ? _SafeStr_5966.replace("%timeleft%", _arg_1) : _arg_1);
        }

        protected function getLocalization(_arg_1:String, _arg_2:String=null):String
        {
            var _local_3:String = _SafeStr_4360.catalog.localization.getLocalization(_arg_1, ((_arg_2) || (_arg_1)));
            if (!_local_3)
            {
                return (null);
            };
            if (_offer)
            {
                _local_3 = _local_3.replace("%itemsleft%", _offer.purchaseLimit);
            };
            return (_local_3);
        }


    }
}//package com.sulake.habbo.catalog.targetedoffers

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3392 = "_-Ez" (String#22556, DoABC#4)
// _SafeStr_4360 = "_-58" (String#91, DoABC#4)
// _SafeStr_5305 = "_-U1e" (String#2071, DoABC#4)
// _SafeStr_5966 = "_-e19" (String#6140, DoABC#4)


