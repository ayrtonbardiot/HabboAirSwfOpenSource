// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1536

package _-61T
{
    import _-Ol._SafeStr_1655;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.data._SafeStr_1588;
    import com.sulake.habbo.room.IStuffData;

    [SecureSWF(rename="true")]
    public class _SafeStr_1536 
    {


        public static function parseObjectData(_arg_1:IMessageDataWrapper):_SafeStr_1655
        {
            if (_arg_1 == null)
            {
                return (null);
            };
            var _local_2:int = _arg_1.readInteger();
            var _local_5:_SafeStr_1655 = new _SafeStr_1655(_local_2);
            var _local_3:int = _arg_1.readInteger();
            _local_5.type = _local_3;
            _local_5.x = _arg_1.readInteger();
            _local_5.y = _arg_1.readInteger();
            _local_5.dir = ((_arg_1.readInteger() % 8) * 45);
            _local_5.z = _arg_1.readString();
            _local_5.sizeZ = _arg_1.readString();
            _local_5.extra = _arg_1.readInteger();
            _local_5.data = parseStuffData(_arg_1);
            var _local_4:Number = parseFloat(_local_5.data.getLegacyString());
            if (!isNaN(_local_4))
            {
                _local_5.state = _local_5.data.getLegacyString();
            };
            _local_5.expiryTime = _arg_1.readInteger();
            _local_5.usagePolicy = _arg_1.readInteger();
            _local_5.ownerId = _arg_1.readInteger();
            if (_local_3 < 0)
            {
                _local_5.staticClass = _arg_1.readString();
            };
            return (_local_5);
        }

        public static function parseStuffData(_arg_1:IMessageDataWrapper):IStuffData
        {
            var _local_3:int = _arg_1.readInteger();
            var _local_2:IStuffData = _SafeStr_1588.getStuffDataWrapperForType(_local_3);
            _local_2.initializeFromIncomingMessage(_arg_1);
            return (_local_2);
        }


    }
}//package _-61T

// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1588 = "_-7O" (String#7045, DoABC#3)
// _SafeStr_1655 = "_-f7" (String#9356, DoABC#3)


