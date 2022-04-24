// by nota

//com.sulake.habbo.avatar.events.LibraryLoadedEvent

package com.sulake.habbo.avatar.events
{
    import flash.events.Event;

    public class LibraryLoadedEvent extends Event 
    {

        private var _libName:String;

        public function LibraryLoadedEvent(_arg_1:String, _arg_2:String)
        {
            super(_arg_1);
            this._libName = _arg_2;
        }

        public function get library():String
        {
            return (_libName);
        }


    }
}//package com.sulake.habbo.avatar.events

