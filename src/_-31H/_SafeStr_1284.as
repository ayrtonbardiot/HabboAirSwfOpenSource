// by nota

//_-31H._SafeStr_1284

package _-31H
{
    import com.sulake.core.communication.messages.IMessageParser;
    import _-Ja._SafeStr_1557;
    import _-Ja._SafeStr_1549;
    import _-Ja._SafeStr_1583;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class _SafeStr_1284 implements IMessageParser 
    {

        private var _SafeStr_3740:_SafeStr_1557;
        private var _SafeStr_4729:_SafeStr_1549;
        private var _promotedRooms:_SafeStr_1583;


        public function flush():Boolean
        {
            return (true);
        }

        public function parse(_arg_1:IMessageDataWrapper):Boolean
        {
            _SafeStr_3740 = new _SafeStr_1557(_arg_1);
            var _local_2:int = _arg_1.readInteger();
            if (_local_2 > 0)
            {
                _SafeStr_4729 = new _SafeStr_1549(_arg_1);
            };
            _promotedRooms = new _SafeStr_1583(_arg_1);
            return (true);
        }

        public function get data():_SafeStr_1557
        {
            return (_SafeStr_3740);
        }

        public function get adRoom():_SafeStr_1549
        {
            return (_SafeStr_4729);
        }

        public function get promotedRooms():_SafeStr_1583
        {
            return (_promotedRooms);
        }


    }
}//package _-31H

// _SafeStr_1284 = "_-12L" (String#6568, DoABC#3)
// _SafeStr_1549 = "_-jk" (String#9650, DoABC#3)
// _SafeStr_1557 = "_-l1x" (String#9760, DoABC#3)
// _SafeStr_1583 = "_-51v" (String#6900, DoABC#3)
// _SafeStr_3740 = "_-vf" (String#94, DoABC#3)
// _SafeStr_4729 = "_-X1G" (String#8771, DoABC#3)


