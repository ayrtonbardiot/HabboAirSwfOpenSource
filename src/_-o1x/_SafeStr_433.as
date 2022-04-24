// by nota

//_-o1x._SafeStr_433

package _-o1x
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime._SafeStr_13;

    [SecureSWF(rename="true")]
    public class _SafeStr_433 implements IMessageComposer, _SafeStr_13 
    {

        private var _SafeStr_6600:Array = [];

        public function _SafeStr_433(_arg_1:_SafeStr_1363)
        {
            var _local_4:* = null;
            super();
            _SafeStr_6600.push(_arg_1.roomId);
            _SafeStr_6600.push(_arg_1.name);
            _SafeStr_6600.push(_arg_1.description);
            _SafeStr_6600.push(_arg_1.doorMode);
            _SafeStr_6600.push(((_arg_1.password !== null) ? _arg_1.password : ""));
            _SafeStr_6600.push(_arg_1.maximumVisitors);
            _SafeStr_6600.push(_arg_1.categoryId);
            if (_arg_1.tags)
            {
                _local_4 = [];
                for each (var _local_3:String in _arg_1.tags)
                {
                    if (((_local_3) && (!(_local_3 === ""))))
                    {
                        _local_4.push(_local_3);
                    };
                };
                _SafeStr_6600.push(_local_4.length);
                for each (var _local_2:String in _local_4)
                {
                    _SafeStr_6600.push(_local_2);
                };
            }
            else
            {
                _SafeStr_6600.push(0);
            };
            _SafeStr_6600.push(_arg_1.tradeMode);
            _SafeStr_6600.push(_arg_1.allowPets);
            _SafeStr_6600.push(_arg_1.allowFoodConsume);
            _SafeStr_6600.push(_arg_1.allowWalkThrough);
            _SafeStr_6600.push(_arg_1.hideWalls);
            _SafeStr_6600.push(_arg_1.wallThickness);
            _SafeStr_6600.push(_arg_1.floorThickness);
            _SafeStr_6600.push(_arg_1.whoCanMute);
            _SafeStr_6600.push(_arg_1.whoCanKick);
            _SafeStr_6600.push(_arg_1.whoCanBan);
            _SafeStr_6600.push(_arg_1.chatMode);
            _SafeStr_6600.push(_arg_1.chatBubbleSize);
            _SafeStr_6600.push(_arg_1.chatScrollUpFrequency);
            _SafeStr_6600.push(_arg_1.chatFullHearRange);
            _SafeStr_6600.push(_arg_1.chatFloodSensitivity);
            _SafeStr_6600.push(_arg_1.allowNavigatorDynCats);
        }

        public function getMessageArray():Array
        {
            return (_SafeStr_6600);
        }

        public function dispose():void
        {
            _SafeStr_6600 = null;
        }

        public function get disposed():Boolean
        {
            return (false);
        }


    }
}//package _-o1x

// _SafeStr_13 = "_-P1N" (String#8235, DoABC#3)
// _SafeStr_1363 = "_-ci" (String#9154, DoABC#3)
// _SafeStr_433 = "_-S1C" (String#8401, DoABC#3)
// _SafeStr_6600 = "_-91h" (String#56, DoABC#3)


