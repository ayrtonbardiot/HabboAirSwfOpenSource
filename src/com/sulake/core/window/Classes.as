// by nota

//com.sulake.core.window.Classes

package com.sulake.core.window
{
    import flash.utils.Dictionary;
    import com.sulake.core.window.components.ActivatorController;
    import com.sulake.core.window.components.BackgroundController;
    import com.sulake.core.window.components.BorderController;
    import com.sulake.core.window.components.BoxSizerController;
    import com.sulake.core.window.components.BubbleController;
    import com.sulake.core.window.components.ButtonController;
    import com.sulake.core.window.components.SelectableButtonController;
    import com.sulake.core.window.components.BitmapWrapperController;
    import com.sulake.core.window.components.CheckBoxController;
    import com.sulake.core.window.components.ContainerController;
    import com.sulake.core.window.components.ContainerButtonController;
    import com.sulake.core.window.components.CloseButtonController;
    import com.sulake.core.window.components.DisplayObjectWrapperController;
    import com.sulake.core.window.components.ScrollBarLiftController;
    import com.sulake.core.window.components.DropMenuController;
    import com.sulake.core.window.components.DropMenuItemController;
    import com.sulake.core.window.components.DropListController;
    import com.sulake.core.window.components.DropListItemController;
    import com.sulake.core.window.components.FormattedTextController;
    import com.sulake.core.window.components.FrameController;
    import com.sulake.core.window.components.HeaderController;
    import com.sulake.core.window.components.HTMLTextController;
    import com.sulake.core.window.components.IconController;
    import com.sulake.core.window.components.ItemListController;
    import com.sulake.core.window.components.ItemGridController;
    import com.sulake.core.window.components.TextLabelController;
    import com.sulake.core.window.components.TextLinkController;
    import com.sulake.core.window.components.PasswordFieldController;
    import com.sulake.core.window.components.RadioButtonController;
    import com.sulake.core.window.components.RegionController;
    import com.sulake.core.window.components.ScalerController;
    import com.sulake.core.window.components.ScrollBarController;
    import com.sulake.core.window.components.ScrollableItemListWindow;
    import com.sulake.core.window.components.ScrollableItemGridWindow;
    import com.sulake.core.window.components.SelectorController;
    import com.sulake.core.window.components.SelectorListController;
    import com.sulake.core.window.components.StaticBitmapWrapperController;
    import com.sulake.core.window.components.TabButtonController;
    import com.sulake.core.window.components.TabContainerButtonController;
    import com.sulake.core.window.components.TabContextController;
    import com.sulake.core.window.components.TextController;
    import com.sulake.core.window.components.TextFieldController;
    import com.sulake.core.window.components.ToolTipController;
    import com.sulake.core.window.components.WidgetWindowController;
    import com.sulake.core.window.components.*;

    public class Classes 
    {

        protected static var _SafeStr_4034:Dictionary;


        public static function init():void
        {
            if (!_SafeStr_4034)
            {
                _SafeStr_4034 = new Dictionary();
                _SafeStr_4034[0] = WindowController;
                _SafeStr_4034[40] = ActivatorController;
                _SafeStr_4034[2] = BackgroundController;
                _SafeStr_4034[30] = BorderController;
                _SafeStr_4034[17] = BoxSizerController;
                _SafeStr_4034[45] = BubbleController;
                _SafeStr_4034[46] = WindowController;
                _SafeStr_4034[47] = WindowController;
                _SafeStr_4034[48] = WindowController;
                _SafeStr_4034[49] = WindowController;
                _SafeStr_4034[60] = ButtonController;
                _SafeStr_4034[61] = ButtonController;
                _SafeStr_4034[67] = SelectableButtonController;
                _SafeStr_4034[68] = SelectableButtonController;
                _SafeStr_4034[69] = SelectableButtonController;
                _SafeStr_4034[21] = BitmapWrapperController;
                _SafeStr_4034[70] = CheckBoxController;
                _SafeStr_4034[4] = ContainerController;
                _SafeStr_4034[41] = ContainerButtonController;
                _SafeStr_4034[72] = CloseButtonController;
                _SafeStr_4034[20] = DisplayObjectWrapperController;
                _SafeStr_4034[76] = ScrollBarLiftController;
                _SafeStr_4034[102] = DropMenuController;
                _SafeStr_4034[103] = DropMenuItemController;
                _SafeStr_4034[105] = DropListController;
                _SafeStr_4034[106] = DropListItemController;
                _SafeStr_4034[15] = FormattedTextController;
                _SafeStr_4034[35] = FrameController;
                _SafeStr_4034[6] = HeaderController;
                _SafeStr_4034[11] = HTMLTextController;
                _SafeStr_4034[1] = IconController;
                _SafeStr_4034[50] = ItemListController;
                _SafeStr_4034[51] = ItemListController;
                _SafeStr_4034[50] = ItemListController;
                _SafeStr_4034[52] = ItemGridController;
                _SafeStr_4034[54] = ItemGridController;
                _SafeStr_4034[53] = ItemGridController;
                _SafeStr_4034[12] = TextLabelController;
                _SafeStr_4034[14] = TextLinkController;
                _SafeStr_4034[78] = PasswordFieldController;
                _SafeStr_4034[71] = RadioButtonController;
                _SafeStr_4034[5] = RegionController;
                _SafeStr_4034[120] = ScalerController;
                _SafeStr_4034[130] = ScrollBarController;
                _SafeStr_4034[131] = ScrollBarController;
                _SafeStr_4034[139] = ButtonController;
                _SafeStr_4034[137] = ButtonController;
                _SafeStr_4034[138] = ButtonController;
                _SafeStr_4034[136] = ButtonController;
                _SafeStr_4034[132] = ScrollBarLiftController;
                _SafeStr_4034[133] = ScrollBarLiftController;
                _SafeStr_4034[134] = WindowController;
                _SafeStr_4034[135] = WindowController;
                _SafeStr_4034[56] = ScrollableItemListWindow;
                _SafeStr_4034[140] = ScrollableItemGridWindow;
                _SafeStr_4034[42] = SelectorController;
                _SafeStr_4034[43] = SelectorListController;
                _SafeStr_4034[23] = StaticBitmapWrapperController;
                _SafeStr_4034[93] = TabButtonController;
                _SafeStr_4034[94] = TabContainerButtonController;
                _SafeStr_4034[90] = ContainerController;
                _SafeStr_4034[91] = TabContextController;
                _SafeStr_4034[92] = SelectorListController;
                _SafeStr_4034[10] = TextController;
                _SafeStr_4034[77] = TextFieldController;
                _SafeStr_4034[8] = ToolTipController;
                _SafeStr_4034[16] = WidgetWindowController;
            };
        }

        public static function getWindowClassByType(_arg_1:uint):Class
        {
            return (_SafeStr_4034[_arg_1]);
        }


    }
}//package com.sulake.core.window

// _SafeStr_4034 = "_-kL" (String#1334, DoABC#4)


