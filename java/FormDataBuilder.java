package java;

/**
 * Created by: Niklas
 * Date: 02.03.2018
 * Alias: Dinh
 * Time: 14:10
 */

public class FormDataBuilder {
    private StringBuilder builder = new StringBuilder();
    private DataBuilder data = new DataBuilder(this);
    private String url;

    class DataBuilder {
        private FormDataBuilder formDataBuilder;

        DataBuilder(FormDataBuilder formDataBuilder) {
            this.formDataBuilder = formDataBuilder;
        }

        DataBuilder append(String key, String value) {
            builder.append(key).append("=").append(value).append("&");
            return this;
        }

        FormDataBuilder get() {
            return formDataBuilder;
        }
    }

    FormDataBuilder(String url) {
        this.url = url;
        builder.append("?");
    }

    DataBuilder getBuilder() {
        return data;
    }

    @Override
    public String toString() {
        String current = builder.toString();
        return url + current.substring(0, current.length() - 1);
    }
}
