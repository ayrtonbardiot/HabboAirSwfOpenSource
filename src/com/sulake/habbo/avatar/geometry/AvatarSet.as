// by nota

//com.sulake.habbo.avatar.geometry.AvatarSet

package com.sulake.habbo.avatar.geometry
{
    import flash.utils.Dictionary;

    public class AvatarSet 
    {

        private var _SafeStr_3820:String;
        private var _SafeStr_6557:Dictionary;
        private var _SafeStr_6558:Array;
        private var _SafeStr_6559:Array;
        private var _isMain:Boolean;

        public function AvatarSet(_arg_1:XML)
        {
            var _local_4:* = null;
            super();
            _SafeStr_3820 = String(_arg_1.@id);
            var _local_3:String = String(_arg_1.@main);
            _isMain = ((_local_3 == null) ? false : parseInt(_local_3));
            _SafeStr_6557 = new Dictionary();
            _SafeStr_6558 = [];
            for each (var _local_6:XML in _arg_1.avatarset)
            {
                _local_4 = new AvatarSet(_local_6);
                _SafeStr_6557[String(_local_6.@id)] = _local_4;
            };
            for each (var _local_2:XML in _arg_1.bodypart)
            {
                _SafeStr_6558.push(String(_local_2.@id));
            };
            var _local_5:Array = _SafeStr_6558.concat();
            for each (_local_4 in _SafeStr_6557)
            {
                _local_5 = _local_5.concat(_local_4.getBodyParts());
            };
            _SafeStr_6559 = _local_5;
        }

        public function findAvatarSet(_arg_1:String):AvatarSet
        {
            if (_arg_1 == _SafeStr_3820)
            {
                return (this);
            };
            for each (var _local_2:AvatarSet in _SafeStr_6557)
            {
                if (_local_2.findAvatarSet(_arg_1) != null)
                {
                    return (_local_2);
                };
            };
            return (null);
        }

        public function getBodyParts():Array
        {
            return (_SafeStr_6559.concat());
        }

        public function get id():String
        {
            return (_SafeStr_3820);
        }

        public function get isMain():Boolean
        {
            if (_isMain)
            {
                return (true);
            };
            for each (var _local_1:AvatarSet in _SafeStr_6557)
            {
                if (_local_1.isMain)
                {
                    return (true);
                };
            };
            return (false);
        }


    }
}//package com.sulake.habbo.avatar.geometry

// _SafeStr_3820 = "_-t1q" (String#209, DoABC#4)
// _SafeStr_6557 = "_-RP" (String#10924, DoABC#4)
// _SafeStr_6558 = "_-Tv" (String#14316, DoABC#4)
// _SafeStr_6559 = "_-uE" (String#18474, DoABC#4)


