// by nota

//_-a1N._SafeStr_322

package _-a1N
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-MB._SafeStr_1358;

    [SecureSWF(rename="true")]
    public class _SafeStr_322 extends MessageEvent implements IMessageEvent 
    {

        public static const _SafeStr_7138:int = 0;
        public static const _SafeStr_7139:int = 1;

        public function _SafeStr_322(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1358);
        }

        private function getParser():_SafeStr_1358
        {
            return (this._SafeStr_7012 as _SafeStr_1358);
        }

        public function get outfits():Array
        {
            return (getParser().outfits);
        }

        public function get state():int
        {
            return (getParser().state);
        }


    }
}//package _-a1N

// _SafeStr_1358 = "_-d1l" (String#9221, DoABC#3)
// _SafeStr_322 = "_-1H" (String#6598, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_7138 = "_-7a" (String#7051, DoABC#3)
// _SafeStr_7139 = "_-i1h" (String#9537, DoABC#3)


