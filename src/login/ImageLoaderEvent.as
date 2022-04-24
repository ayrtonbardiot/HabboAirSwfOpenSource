// by nota

//login.ImageLoaderEvent

package login
{
    import flash.events.Event;
    import flash.display.Loader;

    public class ImageLoaderEvent extends Event 
    {

        private var _SafeStr_6780:Loader;
        private var _SafeStr_5275:String;

        public function ImageLoaderEvent(_arg_1:String, _arg_2:Loader, _arg_3:String)
        {
            _SafeStr_6780 = _arg_2;
            _SafeStr_5275 = _arg_3;
            super(_arg_1, false, false);
        }

        public function get loader():Loader
        {
            return (_SafeStr_6780);
        }

        public function get url():String
        {
            return (_SafeStr_5275);
        }


    }
}//package login

// _SafeStr_5275 = "_-J1N" (String#7775, DoABC#3)
// _SafeStr_6780 = "_-Y1l" (String#8851, DoABC#3)


