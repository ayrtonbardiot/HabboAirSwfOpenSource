// by nota

//com.sulake.habbo.avatar.effects.EffectsView

package com.sulake.habbo.avatar.effects
{
    import com.sulake.habbo.avatar.common.CategoryBaseView;
    import com.sulake.habbo.avatar.common._SafeStr_3396;
    import com.sulake.habbo.avatar.common._SafeStr_3301;
    import com.sulake.core.window._SafeStr_3133;

    public class EffectsView extends CategoryBaseView implements _SafeStr_3396 
    {

        public function EffectsView(_arg_1:_SafeStr_3301)
        {
            super(_arg_1);
        }

        override public function init():void
        {
            if (!_window)
            {
                _window = (_SafeStr_4619.controller.view.getCategoryContainer("effects") as _SafeStr_3133);
                _window.visible = false;
            };
            if (((_SafeStr_4619) && (_SafeStr_3887 == "")))
            {
                _SafeStr_4619.switchCategory("effects");
            };
            _SafeStr_3883 = true;
            updateGridView(_SafeStr_3887);
        }

        override public function reset():void
        {
            updateGridView(_SafeStr_3887);
            _SafeStr_4619.selectPart(_SafeStr_3887, -1);
        }

        public function switchCategory(_arg_1:String):void
        {
            if (_window == null)
            {
                return;
            };
            if (_window.disposed)
            {
                return;
            };
            _arg_1 = ((_arg_1 == "") ? _SafeStr_3887 : _arg_1);
            _SafeStr_3887 = _arg_1;
            if (!_SafeStr_3883)
            {
                init();
            };
            updateGridView(_SafeStr_3887);
        }

        public function updateSelectionVisual(_arg_1:String, _arg_2:int, _arg_3:Boolean):void
        {
            AvatarEditorGridViewEffects(_SafeStr_4619.controller.view.effectsGridView).updateSelection(_arg_2, _arg_3);
        }

        public function getGridIndex(_arg_1:int):int
        {
            return (AvatarEditorGridViewEffects(_SafeStr_4619.controller.view.effectsGridView).getGridIndex(_arg_1));
        }

        override protected function updateGridView(_arg_1:String):void
        {
            _SafeStr_4619.controller.view.effectsGridView.initFromList(_SafeStr_4619, _arg_1);
        }


    }
}//package com.sulake.habbo.avatar.effects

// _SafeStr_3133 = "_-U1F" (String#18, DoABC#4)
// _SafeStr_3301 = "_-f1d" (String#2199, DoABC#4)
// _SafeStr_3396 = "_-wy" (String#6678, DoABC#4)
// _SafeStr_3883 = "_-w1c" (String#683, DoABC#4)
// _SafeStr_3887 = "_-6N" (String#2449, DoABC#4)
// _SafeStr_4619 = "_-x1i" (String#278, DoABC#4)


