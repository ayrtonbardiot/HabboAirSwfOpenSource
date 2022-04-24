// by nota

//com.sulake.habbo.avatar.AvatarFigureContainer

package com.sulake.habbo.avatar
{
    import com.sulake.core.utils._SafeStr_24;

    public class AvatarFigureContainer implements _SafeStr_3164 
    {

        private var _SafeStr_4463:_SafeStr_24;

        public function AvatarFigureContainer(_arg_1:String)
        {
            _SafeStr_4463 = new _SafeStr_24();
            parseFigureString(_arg_1);
        }

        public function getPartTypeIds():Array
        {
            return (getParts().getKeys());
        }

        public function hasPartType(_arg_1:String):Boolean
        {
            return (!(getParts().getValue(_arg_1) == null));
        }

        public function getPartSetId(_arg_1:String):int
        {
            var _local_2:_SafeStr_24 = (getParts().getValue(_arg_1) as _SafeStr_24);
            if (_local_2 != null)
            {
                return (_local_2.getValue("setid") as int);
            };
            return (0);
        }

        public function getPartColorIds(_arg_1:String):Array
        {
            var _local_2:_SafeStr_24 = (getParts().getValue(_arg_1) as _SafeStr_24);
            if (_local_2 != null)
            {
                return (_local_2.getValue("colorids") as Array);
            };
            return (null);
        }

        public function updatePart(_arg_1:String, _arg_2:int, _arg_3:Array):void
        {
            var _local_4:_SafeStr_24 = new _SafeStr_24();
            _local_4.add("type", _arg_1);
            _local_4.add("setid", _arg_2);
            _local_4.add("colorids", _arg_3);
            var _local_5:_SafeStr_24 = getParts();
            _local_5.remove(_arg_1);
            _local_5.add(_arg_1, _local_4);
        }

        public function removePart(_arg_1:String):void
        {
            getParts().remove(_arg_1);
        }

        public function getFigureString():String
        {
            var _local_3:* = null;
            var _local_1:Array = [];
            for each (var _local_2:String in getParts().getKeys())
            {
                _local_3 = [];
                _local_3.push(_local_2);
                _local_3.push(getPartSetId(_local_2));
                _local_3 = _local_3.concat(getPartColorIds(_local_2));
                _local_1.push(_local_3.join("-"));
            };
            return (_local_1.join("."));
        }

        private function getParts():_SafeStr_24
        {
            if (_SafeStr_4463 == null)
            {
                _SafeStr_4463 = new _SafeStr_24();
            };
            return (_SafeStr_4463);
        }

        private function parseFigureString(_arg_1:String):void
        {
            var _local_3:* = null;
            var _local_6:* = null;
            var _local_4:int;
            var _local_2:* = null;
            var _local_5:int;
            if (_arg_1 == null)
            {
                _arg_1 = "";
            };
            for each (var _local_7:String in _arg_1.split("."))
            {
                _local_3 = _local_7.split("-");
                if (_local_3.length >= 2)
                {
                    _local_6 = String(_local_3[0]);
                    _local_4 = parseInt(_local_3[1]);
                    _local_2 = [];
                    _local_5 = 2;
                    while (_local_5 < _local_3.length)
                    {
                        _local_2.push(parseInt(_local_3[_local_5]));
                        _local_5++;
                    };
                    updatePart(_local_6, _local_4, _local_2);
                };
            };
        }


    }
}//package com.sulake.habbo.avatar

// _SafeStr_24 = "_-W1s" (String#60, DoABC#4)
// _SafeStr_3164 = "_-rH" (String#2534, DoABC#4)
// _SafeStr_4463 = "_-n1k" (String#1592, DoABC#4)


