// by nota

//com.sulake.core.localization.Localization

package com.sulake.core.localization
{
    import flash.utils.Dictionary;

    public class Localization implements ILocalization 
    {

        private var _SafeStr_4144:_SafeStr_17;
        private var _key:String;
        private var _SafeStr_4525:String;
        private var _parameters:Dictionary;
        private var _listeners:Array;
        private var _SafeStr_3883:Boolean = false;

        public function Localization(_arg_1:_SafeStr_17, _arg_2:String, _arg_3:String=null)
        {
            _SafeStr_4144 = _arg_1;
            _key = _arg_2;
            _SafeStr_4525 = _arg_3;
        }

        public function get isInitialized():Boolean
        {
            return (!(_SafeStr_4525 == null));
        }

        public function get value():String
        {
            return (fillParameterValues());
        }

        public function get raw():String
        {
            return (_SafeStr_4525);
        }

        public function setValue(_arg_1:String):void
        {
            _SafeStr_4525 = _arg_1;
            updateListeners();
        }

        public function registerListener(_arg_1:ILocalizable):void
        {
            if (!_listeners)
            {
                _listeners = [];
            };
            if (_listeners.indexOf(_arg_1) == -1)
            {
                _listeners.push(_arg_1);
            };
            _arg_1.localization = value;
        }

        public function removeListener(_arg_1:ILocalizable):void
        {
            var _local_2:int;
            if (_listeners)
            {
                _local_2 = _listeners.indexOf(_arg_1);
                if (_local_2 >= 0)
                {
                    _listeners.splice(_local_2, 1);
                };
            };
        }

        public function registerParameter(_arg_1:String, _arg_2:String, _arg_3:String="%"):void
        {
            if (!_parameters)
            {
                _parameters = new Dictionary();
            };
            _parameters[_arg_1] = {
                "id":_arg_3,
                "value":_arg_2
            };
            updateListeners();
        }

        public function updateListeners():void
        {
            if (_listeners)
            {
                for each (var _local_1:ILocalizable in _listeners)
                {
                    _local_1.localization = value;
                };
            };
        }

        private function fillParameterValues():String
        {
            var _local_12:* = null;
            var _local_15:* = null;
            var _local_7:* = null;
            var _local_13:* = null;
            var _local_1:int;
            var _local_4:* = null;
            var _local_8:* = null;
            var _local_6:int;
            var _local_3:* = null;
            var _local_11:* = null;
            var _local_10:* = null;
            var _local_9:String = _SafeStr_4525;
            if (_local_9 == null)
            {
                return (null);
            };
            if (_parameters)
            {
                for (var _local_14:String in _parameters)
                {
                    _local_12 = _parameters[_local_14];
                    _local_15 = ((_local_12.id + _local_14) + _local_12.id);
                    _local_7 = _local_12.value;
                    _local_13 = new RegExp(_local_15, "gim");
                    _local_9 = _local_9.replace(_local_13, _local_7);
                    if (_local_9.toLowerCase().indexOf(((_local_12.id + "{") + _local_14)) >= 0)
                    {
                        switch (_local_7)
                        {
                            case 0:
                                _local_1 = 1;
                                break;
                            case 1:
                                _local_1 = 2;
                                break;
                            default:
                                _local_1 = 3;
                        };
                        _local_4 = new RegExp((((_local_12.id + "\\{") + _local_14) + "\\|([^|]*)\\|([^|]*)\\|([^}]*)\\}"), "gim");
                        _local_8 = new RegExp((_local_12.id + _local_12.id), "gim");
                        _local_9 = _local_9.replace(_local_4, ("$" + _local_1));
                        _local_9 = _local_9.replace(_local_8, _local_7);
                    };
                };
            };
            var _local_2:RegExp = new RegExp("%%%([A-Za-z0-9_])+%%%", "g");
            var _local_5:Array = _local_9.match(_local_2);
            if (_local_5 != null)
            {
                _local_6 = (_local_5.length - 1);
                while (_local_6 >= 0)
                {
                    _local_3 = _local_5[_local_6].substring(3, (_local_5[_local_6].length - 3));
                    _local_11 = ((_key + ".") + _local_3);
                    _local_10 = _SafeStr_4144.getLocalization(_local_11, _local_3);
                    _local_9 = _local_9.replace(_local_5[_local_6], _local_10);
                    _local_6--;
                };
            };
            return (_local_9);
        }


    }
}//package com.sulake.core.localization

// _SafeStr_17 = "_-94" (String#7182, DoABC#3)
// _SafeStr_3883 = "_-w1c" (String#10459, DoABC#3)
// _SafeStr_4144 = "_-n1T" (String#9877, DoABC#3)
// _SafeStr_4525 = "_-8S" (String#7130, DoABC#3)


