// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.habbo.session.PerkManager

package com.sulake.habbo.session
{
    import com.sulake.core.runtime._SafeStr_13;
    import com.sulake.core.communication.messages.IMessageEvent;
    import flash.utils.Dictionary;
    import _-111._SafeStr_779;
    import _-f1y._SafeStr_1585;
    import com.sulake.habbo.session.events.PerksUpdatedEvent;

    public class PerkManager implements _SafeStr_13 
    {

        private var _SafeStr_4211:Boolean = false;
        private var _sessionDataManager:SessionDataManager;
        private var _perkAllowancesMessageEvent:IMessageEvent;
        private var _SafeStr_4749:Dictionary = new Dictionary();

        public function PerkManager(_arg_1:SessionDataManager)
        {
            _sessionDataManager = _arg_1;
            if (_sessionDataManager.communication)
            {
                _perkAllowancesMessageEvent = _sessionDataManager.communication.addHabboConnectionMessageEvent(new _SafeStr_779(onPerkAllowances));
            };
        }

        public function get disposed():Boolean
        {
            return (_sessionDataManager == null);
        }

        public function dispose():void
        {
            if (disposed)
            {
                return;
            };
            if (_SafeStr_4749)
            {
                for (var _local_1:String in _SafeStr_4749)
                {
                    delete _SafeStr_4749[_local_1];
                };
                _SafeStr_4749 = null;
            };
            if (_sessionDataManager.communication)
            {
                _sessionDataManager.communication.removeHabboConnectionMessageEvent(_perkAllowancesMessageEvent);
            };
            _perkAllowancesMessageEvent = null;
            _sessionDataManager = null;
        }

        public function get isReady():Boolean
        {
            return (_SafeStr_4211);
        }

        public function isPerkAllowed(_arg_1:String):Boolean
        {
            return ((_arg_1 in _SafeStr_4749) && (_SafeStr_4749[_arg_1].isAllowed));
        }

        public function getPerkErrorMessage(_arg_1:String):String
        {
            var _local_2:_SafeStr_1585 = _SafeStr_4749[_arg_1];
            return ((_local_2 != null) ? _local_2.errorMessage : "");
        }

        private function onPerkAllowances(_arg_1:_SafeStr_779):void
        {
            for each (var _local_2:_SafeStr_1585 in _arg_1.getParser().getPerks())
            {
                _SafeStr_4749[_local_2.code] = _local_2;
            };
            _SafeStr_4211 = true;
            _sessionDataManager.events.dispatchEvent(new PerksUpdatedEvent());
        }


    }
}//package com.sulake.habbo.session

// _SafeStr_13 = "_-P1N" (String#326, DoABC#4)
// _SafeStr_1585 = "_-xW" (String#31152, DoABC#4)
// _SafeStr_4211 = "_-pm" (String#4979, DoABC#4)
// _SafeStr_4749 = "_-b1i" (String#6437, DoABC#4)
// _SafeStr_779 = "_-s1X" (String#3814, DoABC#4)


