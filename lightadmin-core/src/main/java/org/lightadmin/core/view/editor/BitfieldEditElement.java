package org.lightadmin.core.view.editor;

import java.io.Serializable;

public class BitfieldEditElement implements Serializable {

    private static final long serialVersionUID = 1L;

    private final String label;
    private final Integer value;

    public BitfieldEditElement(String label, Integer value) {
        this.label = label;
        this.value = value;
    }

    public String getLabel() {
        return label;
    }

    public Integer getValue() {
        return value;
    }
}
