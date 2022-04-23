// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1281

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.habbo.room.object.data._SafeStr_1613;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1281 implements IMessageParser 
    {

        private var _SafeStr_3820:int = 0;
        private var _SafeStr_3734:int = 0;
        private var _SafeStr_3740:IStuffData;


        public function get id():int
        {
            return (_SafeStr_3820);
        }

        public function get state():int
        {
            return (_SafeStr_3734);
        }

        public function get data():IStuffData
        {
            return (_SafeStr_3740);
        }

        public function flush():Boolean
        {
            _SafeStr_3734 = 0;
            _SafeStr_3740 = (new _SafeStr_1613() as IStuffData);
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            if (_arg_1 == null)
            {
                return (false);
            };
            var _local_3:String = _arg_1.readString();
            _SafeStr_3820 = _local_3;
            _SafeStr_3740 = _SafeStr_1536.parseStuffData(_arg_1);
            var _local_2:Number = parseFloat(_SafeStr_3740.getLegacyString());
            if (!isNaN(_local_2))
            {
                _SafeStr_3734 = _SafeStr_3740.getLegacyString();
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1281 = "_-51U" (String#6886, DoABC#3)
// _SafeStr_1536 = "_-KW" (String#7917, DoABC#3)
// _SafeStr_1613 = "_-xG" (String#10553, DoABC#3)
// _SafeStr_3734 = "_-g1U" (String#9397, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_3820 = "_-t1q" (String#10263, DoABC#3)


