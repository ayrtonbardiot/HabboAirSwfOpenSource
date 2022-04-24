// by nota

//_-sq._SafeStr_1240

package _-sq
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1240 implements IMessageParser 
    {

        private var _SafeStr_7524:int;
        private var _SafeStr_7525:Array;


        public function get percentage():int
        {
            return (_SafeStr_7524);
        }

        public function get finishedPlayers():Array
        {
            return (_SafeStr_7525);
        }

        public function flush():Boolean
        {
            return (false);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_3:int;
            _SafeStr_7524 = _arg_1.readInteger();
            _SafeStr_7525 = [];
            var _local_2:int = _arg_1.readInteger();
            _local_3 = 0;
            while (_local_3 < _local_2)
            {
                _SafeStr_7525.push(_arg_1.readInteger());
                _local_3++;
            };
            return (true);
        }


    }
}//package _-sq

// _SafeStr_1240 = "_-n8" (String#9895, DoABC#3)
// _SafeStr_7524 = "_-b11" (String#9038, DoABC#3)
// _SafeStr_7525 = "_-O1D" (String#8134, DoABC#3)


