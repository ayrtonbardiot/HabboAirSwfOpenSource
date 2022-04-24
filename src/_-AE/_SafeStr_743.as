// by nota

//_-AE._SafeStr_743

package _-AE
{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import _-g1G._SafeStr_1089;

    [SecureSWF(rename="true")]
    public class _SafeStr_743 extends MessageEvent implements IMessageEvent 
    {

        public function _SafeStr_743(_arg_1:Function)
        {
            super(_arg_1, _SafeStr_1089);
        }

        public function getParser():_SafeStr_1089
        {
            return (this._SafeStr_7012 as _SafeStr_1089);
        }

        public function get instantlyRefreshCatalogue():Boolean
        {
            return (getParser().instantlyRefreshCatalogue);
        }

        public function get newFurniDataHash():String
        {
            return (getParser().newFurniDataHash);
        }


    }
}//package _-AE

// _SafeStr_1089 = "_-an" (String#9027, DoABC#3)
// _SafeStr_7012 = "_-M1e" (String#67, DoABC#3)
// _SafeStr_743 = "_-Y1X" (String#8842, DoABC#3)


