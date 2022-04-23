// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-Z1C._SafeStr_1050

package _-Z1C
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-n1H._SafeStr_1553;
    import _-n1H._SafeStr_1626;
    import _-n1H._SafeStr_1625;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1050 implements IMessageParser 
    {

        private var _SafeStr_7852:_SafeStr_1553;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7852 = new _SafeStr_1553();
            _SafeStr_7852.roomId = _arg_1.readInteger();
            _SafeStr_7852.name = _arg_1.readString();
            _SafeStr_7852.description = _arg_1.readString();
            _SafeStr_7852.doorMode = _arg_1.readInteger();
            _SafeStr_7852.categoryId = _arg_1.readInteger();
            _SafeStr_7852.maximumVisitors = _arg_1.readInteger();
            _SafeStr_7852.maximumVisitorsLimit = _arg_1.readInteger();
            _SafeStr_7852.tags = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7852.tags.push(_arg_1.readString());
                _local_3++;
            };
            _SafeStr_7852.tradeMode = _arg_1.readInteger();
            _SafeStr_7852.allowPets = (_arg_1.readInteger() == 1);
            _SafeStr_7852.allowFoodConsume = (_arg_1.readInteger() == 1);
            _SafeStr_7852.allowWalkThrough = (_arg_1.readInteger() == 1);
            _SafeStr_7852.hideWalls = (_arg_1.readInteger() == 1);
            _SafeStr_7852.wallThickness = _arg_1.readInteger();
            _SafeStr_7852.floorThickness = _arg_1.readInteger();
            _SafeStr_7852.chatSettings = new _SafeStr_1626(_arg_1);
            _SafeStr_7852.allowNavigatorDynamicCats = _arg_1.readBoolean();
            _SafeStr_7852.roomModerationSettings = new _SafeStr_1625(_arg_1);
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7852 = null;
            return (true);
        }

        public function get data():_SafeStr_1553
        {
            return (_SafeStr_7852);
        }


    }
}//package _-Z1C

// _SafeStr_1050 = "_-Cq" (String#7404, DoABC#3)
// _SafeStr_1553 = "_-R1f" (String#8350, DoABC#3)
// _SafeStr_1625 = "_-Ug" (String#8591, DoABC#3)
// _SafeStr_1626 = "_-51" (String#6869, DoABC#3)
// _SafeStr_7852 = "_-V1Y" (String#8621, DoABC#3)


