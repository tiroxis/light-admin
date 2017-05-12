package org.lightadmin.core.view.editor;

import java.util.List;

public class BitfieldEditControl extends JspFragmentFieldControl {

    private final List<String> labels;

    public BitfieldEditControl(List<String> labels) {
        super("/views/editors/bitfield-edit-control.jsp");
        this.labels = labels;
    }

    @Override
    protected void prepare() {
        addAttribute("labels", labels);
    }

}
