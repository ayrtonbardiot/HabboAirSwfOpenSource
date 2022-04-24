// by nota

//ICoreWindowFrameworkLib

package 
{
    import com.sulake.iid.IIDCoreWindowManager;
    import com.sulake.core.window._SafeStr_1694;
    import com.sulake.core.window._SafeStr_3109;
    import com.sulake.core.window._SafeStr_3133;
    import com.sulake.core.window._SafeStr_3160;
    import com.sulake.core.window.components._SafeStr_3218;
    import com.sulake.core.window.components._SafeStr_3264;
    import com.sulake.core.window.components._SafeStr_3195;
    import com.sulake.core.window.components._SafeStr_3122;
    import com.sulake.core.window.components._SafeStr_3243;
    import com.sulake.core.window.components._SafeStr_3158;
    import com.sulake.core.window.components._SafeStr_3240;
    import com.sulake.core.window.components._SafeStr_3216;
    import com.sulake.core.window.components._SafeStr_3189;
    import com.sulake.core.window.components._SafeStr_3244;
    import com.sulake.core.window.components._SafeStr_3230;
    import com.sulake.core.window.components._SafeStr_3269;
    import com.sulake.core.window.components._SafeStr_3263;
    import com.sulake.core.window.components._SafeStr_3251;
    import com.sulake.core.window.components.IIconWindow;
    import com.sulake.core.window.components.IInteractiveWindow;
    import com.sulake.core.window.components.IItemGridWindow;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.core.window.components.INotifyWindow;
    import com.sulake.core.window.components._SafeStr_3183;
    import com.sulake.core.window.components.IRadioButtonSelectionWindow;
    import com.sulake.core.window.components.IRadioButtonWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.IScalerWindow;
    import com.sulake.core.window.components.IScrollableWindow;
    import com.sulake.core.window.components.IScrollbarWindow;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.ITabButtonWindow;
    import com.sulake.core.window.components.ITabContentWindow;
    import com.sulake.core.window.components.ITabContextWindow;
    import com.sulake.core.window.components.ISelectorListWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.components.IToolBarWindow;
    import com.sulake.core.window.enum._SafeStr_3268;
    import com.sulake.core.window.enum._SafeStr_3215;
    import com.sulake.core.window.enum._SafeStr_3221;
    import com.sulake.core.window.enum._SafeStr_3238;
    import com.sulake.core.window.enum._SafeStr_3168;
    import com.sulake.core.window.events._SafeStr_3116;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowMessage;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.utils.IMargins;

    [SecureSWF(rename="false")]
    public class ICoreWindowFrameworkLib 
    {

        public static var IIDCoreWindowManager:Class = com.sulake.iid.IIDCoreWindowManager;
        public static var _SafeStr_1694:Class = com.sulake.core.window._SafeStr_1694;
        public static var _SafeStr_3109:Class = com.sulake.core.window._SafeStr_3109;
        public static var _SafeStr_3133:Class = com.sulake.core.window._SafeStr_3133;
        public static var _SafeStr_3160:Class = com.sulake.core.window._SafeStr_3160;
        public static var _SafeStr_3218:Class = com.sulake.core.window.components._SafeStr_3218;
        public static var _SafeStr_3264:Class = com.sulake.core.window.components._SafeStr_3264;
        public static var _SafeStr_3195:Class = com.sulake.core.window.components._SafeStr_3195;
        public static var _SafeStr_3122:Class = com.sulake.core.window.components._SafeStr_3122;
        public static var _SafeStr_3243:Class = com.sulake.core.window.components._SafeStr_3243;
        public static var _SafeStr_3158:Class = com.sulake.core.window.components._SafeStr_3158;
        public static var _SafeStr_3240:Class = com.sulake.core.window.components._SafeStr_3240;
        public static var _SafeStr_3216:Class = com.sulake.core.window.components._SafeStr_3216;
        public static var _SafeStr_3189:Class = com.sulake.core.window.components._SafeStr_3189;
        public static var _SafeStr_3244:Class = com.sulake.core.window.components._SafeStr_3244;
        public static var _SafeStr_3945:Class = _SafeStr_3230;
        public static var _SafeStr_3269:Class = com.sulake.core.window.components._SafeStr_3269;
        public static var _SafeStr_3263:Class = com.sulake.core.window.components._SafeStr_3263;
        public static var _SafeStr_3251:Class = com.sulake.core.window.components._SafeStr_3251;
        public static var IIconWindow:Class = com.sulake.core.window.components.IIconWindow;
        public static var IInteractiveWindow:Class = com.sulake.core.window.components.IInteractiveWindow;
        public static var IItemGridWindow:Class = com.sulake.core.window.components.IItemGridWindow;
        public static var IItemListWindow:Class = com.sulake.core.window.components.IItemListWindow;
        public static var INotifyWindow:Class = com.sulake.core.window.components.INotifyWindow;
        public static var _SafeStr_3183:Class = com.sulake.core.window.components._SafeStr_3183;
        public static var IRadioButtonSelectionWindow:Class = com.sulake.core.window.components.IRadioButtonSelectionWindow;
        public static var IRadioButtonWindow:Class = com.sulake.core.window.components.IRadioButtonWindow;
        public static var IRegionWindow:Class = com.sulake.core.window.components.IRegionWindow;
        public static var IScalerWindow:Class = com.sulake.core.window.components.IScalerWindow;
        public static var IScrollableWindow:Class = com.sulake.core.window.components.IScrollableWindow;
        public static var IScrollbarWindow:Class = com.sulake.core.window.components.IScrollbarWindow;
        public static var ISelectableWindow:Class = com.sulake.core.window.components.ISelectableWindow;
        public static var ISelectorWindow:Class = com.sulake.core.window.components.ISelectorWindow;
        public static var ITabButtonWindow:Class = com.sulake.core.window.components.ITabButtonWindow;
        public static var ITabContentWindow:Class = com.sulake.core.window.components.ITabContentWindow;
        public static var ITabContextWindow:Class = com.sulake.core.window.components.ITabContextWindow;
        public static var ISelectorListWindow:Class = com.sulake.core.window.components.ISelectorListWindow;
        public static var ITextFieldWindow:Class = com.sulake.core.window.components.ITextFieldWindow;
        public static var ITextWindow:Class = com.sulake.core.window.components.ITextWindow;
        public static var IToolBarWindow:Class = com.sulake.core.window.components.IToolBarWindow;
        public static var _SafeStr_3268:Class = com.sulake.core.window.enum._SafeStr_3268;
        public static var _SafeStr_3215:Class = com.sulake.core.window.enum._SafeStr_3215;
        public static var _SafeStr_3221:Class = com.sulake.core.window.enum._SafeStr_3221;
        public static var _SafeStr_3238:Class = com.sulake.core.window.enum._SafeStr_3238;
        public static var _SafeStr_3168:Class = com.sulake.core.window.enum._SafeStr_3168;
        public static var _SafeStr_3116:Class = com.sulake.core.window.events._SafeStr_3116;
        public static var WindowKeyboardEvent:Class = com.sulake.core.window.events.WindowKeyboardEvent;
        public static var WindowMessage:Class = com.sulake.core.window.events.WindowMessage;
        public static var WindowMouseEvent:Class = com.sulake.core.window.events.WindowMouseEvent;
        public static var IMargins:Class = com.sulake.core.window.utils.IMargins;


    }
}//package 

// _SafeStr_1694 = "_-41e" (String#5816, DoABC#4)
// _SafeStr_3109 = "_-s1L" (String#23, DoABC#4)
// _SafeStr_3116 = "_-XC" (String#59, DoABC#4)
// _SafeStr_3122 = "_-i1L" (String#666, DoABC#4)
// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3158 = "_-RF" (String#812, DoABC#4)
// _SafeStr_3160 = "_-dQ" (String#2821, DoABC#4)
// _SafeStr_3168 = "_-t1Q" (String#7998, DoABC#4)
// _SafeStr_3183 = "_-ij" (String#6244, DoABC#4)
// _SafeStr_3189 = "_-i1f" (String#1614, DoABC#4)
// _SafeStr_3195 = "_-b1g" (String#876, DoABC#4)
// _SafeStr_3215 = "_-l1M" (String#8239, DoABC#4)
// _SafeStr_3216 = "_-o1L" (String#2319, DoABC#4)
// _SafeStr_3218 = "_-d1L" (String#10038, DoABC#4)
// _SafeStr_3221 = "_-em" (String#11388, DoABC#4)
// _SafeStr_3230 = "_-ve" (String#5713, DoABC#4)
// _SafeStr_3238 = "_-lN" (String#10734, DoABC#4)
// _SafeStr_3240 = "_-O8" (String#1647, DoABC#4)
// _SafeStr_3243 = "_-kI" (String#10514, DoABC#4)
// _SafeStr_3244 = "_-tJ" (String#9937, DoABC#4)
// _SafeStr_3251 = "_-xO" (String#5610, DoABC#4)
// _SafeStr_3263 = "_-21c" (String#378, DoABC#4)
// _SafeStr_3264 = "_-p1I" (String#104, DoABC#4)
// _SafeStr_3268 = "_-Z1r" (String#10543, DoABC#4)
// _SafeStr_3269 = "_-g14" (String#723, DoABC#4)
// _SafeStr_3945 = "_-d17" (String#24742, DoABC#4)


