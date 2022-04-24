// by nota

//_-31H._SafeStr_1059

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1551;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1059 implements IMessageParser 
    {

        private var _SafeStr_7044:Array;


        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            var _local_2:int;
            _SafeStr_7044 = [];
            var _local_3:int = _arg_1.readInteger();
            _local_2 = 0;
            while (_local_2 < _local_3)
            {
                _SafeStr_7044.push(new _SafeStr_1551(_arg_1));
                _local_2++;
            };
            return (true);
        }

        public function flush():Boolean
        {
            _SafeStr_7044 = null;
            return (true);
        }

        public function get eventCategories():Array
        {
            return (_SafeStr_7044);
        }


    }
}//package _-31H

// _SafeStr_1059 = "_-m1H" (String#9798, DoABC#3)
// _SafeStr_1551 = "_-J1A" (String#7770, DoABC#3)
// _SafeStr_7044 = "_-zI" (String#10689, DoABC#3)


