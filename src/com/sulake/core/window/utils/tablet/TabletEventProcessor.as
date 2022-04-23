// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//com.sulake.core.window.utils.tablet.TabletEventProcessor

package com.sulake.core.window.utils.tablet
{
    import com.sulake.core.window.utils.MouseEventProcessor;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.EventProcessorState;
    import com.sulake.core.window.utils.IEventQueue;

    public class TabletEventProcessor extends MouseEventProcessor 
    {

        private var _SafeStr_8254:String = "";


        override public function process(_arg_1:EventProcessorState, _arg_2:IEventQueue):void
        {
            if (_arg_2.length == 0)
            {
                return;
            };
            _SafeStr_4665 = _arg_1.desktop;
            _SafeStr_6254 = (_arg_1._SafeStr_6256 as WindowController);
            _SafeStr_6255 = (_arg_1.lastClickTarget as WindowController);
            _SafeStr_4602 = _arg_1.renderer;
            _eventTrackers = _arg_1.eventTrackers;
            _arg_2.begin();
            _arg_2.end();
            _arg_1.desktop = _SafeStr_4665;
            _arg_1._SafeStr_6256 = _SafeStr_6254;
            _arg_1.lastClickTarget = _SafeStr_6255;
            _arg_1.renderer = _SafeStr_4602;
            _arg_1.eventTrackers = _eventTrackers;
        }


    }
}//package com.sulake.core.window.utils.tablet

// _SafeStr_4602 = "_-61o" (String#2385, DoABC#4)
// _SafeStr_4665 = "_-y1q" (String#2325, DoABC#4)
// _SafeStr_6254 = "_-s1C" (String#3051, DoABC#4)
// _SafeStr_6255 = "_-a1I" (String#3200, DoABC#4)
// _SafeStr_6256 = "_-61c" (String#11678, DoABC#4)
// _SafeStr_8254 = "_-Y1A" (String#35363, DoABC#4)


