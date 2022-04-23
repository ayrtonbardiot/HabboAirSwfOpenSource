// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//_-61T._SafeStr_1347

package _-61T
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1347 implements IMessageParser 
    {

        private var _SafeStr_4777:String = null;
        private var _SafeStr_4778:String = null;
        private var _SafeStr_4779:String = null;
        private var _SafeStr_7111:String = null;


        public function get floorType():String
        {
            return (_SafeStr_4777);
        }

        public function get wallType():String
        {
            return (_SafeStr_4778);
        }

        public function get landscapeType():String
        {
            return (_SafeStr_4779);
        }

        public function get animatedLandscapeType():String
        {
            return (_SafeStr_7111);
        }

        public function flush():Boolean
        {
            _SafeStr_4777 = null;
            _SafeStr_4778 = null;
            _SafeStr_4779 = null;
            _SafeStr_7111 = null;
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:String = _arg_1.readString();
            var _local_2:String = _arg_1.readString();
            switch (_local_3)
            {
                case "floor":
                    _SafeStr_4777 = _local_2;
                    break;
                case "wallpaper":
                    _SafeStr_4778 = _local_2;
                    break;
                case "landscape":
                    _SafeStr_4779 = _local_2;
                    break;
                case "landscapeanim":
                    _SafeStr_7111 = _local_2;
            };
            return (true);
        }


    }
}//package _-61T

// _SafeStr_1347 = "_-K1i" (String#7893, DoABC#3)
// _SafeStr_4777 = "_-S1M" (String#8405, DoABC#3)
// _SafeStr_4778 = "_-xi" (String#10570, DoABC#3)
// _SafeStr_4779 = "_-BB" (String#7326, DoABC#3)
// _SafeStr_7111 = "_-C1P" (String#7362, DoABC#3)


